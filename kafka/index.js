const { Kafka } = require('kafkajs');
const { Pool } = require('pg');

const pool = new Pool({
  host: '10.10.80.20',
  user: 'postgres',
  password: 'Qwerty123',
  database: 'e-gvardiya',
  port: 5432,

  // host: '127.0.0.1',
  // user: 'postgres',
  // password: '1234',
  // database: 'egvardiya',
  // port: 5432,
});

const kafka = new Kafka({
  clientId: 'smpo-client',
  brokers: ['smpo.uzgps.uz:9092'],
  ssl: false,
  sasl: {
    mechanism: 'plain',
    username: 'user3',
    password: 'pass#3213',
  },
   connectionTimeout: 10000,
    requestTimeout: 30000,
});

const topics = [
  { topic: 'mgkt_topic', groupId: 'mgkt' },
  // { topic: "system_events_topic", groupId: "system_events" },
];

async function saveToDb(dataArray) {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    for (const d of dataArray) {
      // 1️⃣ Avval mavjud yozuvni yangilaymiz
      const updateRes = await client.query(
        `UPDATE reports.uzgps
                SET
                    contract_id = $1,
                    mobject_id = $2,
                    plate_number = $3,
                    lat = $4,
                    lon = $5,
                    angle = $6,
                    tp_timestamp_fmt = $7,
                    speed = $8,
                    movement = $9,
                    engine_on = $10,
                    brand_name = $11
                WHERE imei = $12
                `,
        [
          d.contractId,
          d.mobjectId,
          d.plateNumber,
          d.lat,
          d.lon,
          d.angle,
          d.tpTimestampFmt,
          d.speed,
          d.movement,
          d.engineOn,
          d.brandName,
          d.imei,
        ]
      );

      // 2️⃣ Agar yangilanish bo‘lmagan bo‘lsa → yangi yozuv qo‘shamiz
      if (updateRes.rowCount === 0) {
        await client.query(
          `INSERT INTO reports.uzgps (
                        contract_id, mobject_id, plate_number, lat, lon, angle,
                        tp_timestamp_fmt, speed, movement, engine_on, brand_name, imei
                    ) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12)
                `,
          [
            d.contractId,
            d.mobjectId,
            d.plateNumber,
            d.lat,
            d.lon,
            d.angle,
            d.tpTimestampFmt,
            d.speed,
            d.movement,
            d.engineOn,
            d.brandName,
            d.imei,
          ]
        );
      }
    }

    await client.query('COMMIT');
  } catch (err) {
    await client.query('ROLLBACK');
    console.error('❌ DB insert/update error:', err);
  } finally {
    client.release();
  }
}

async function runConsumers() {
  for (const { topic, groupId } of topics) {
    const consumer = kafka.consumer({ groupId });

    await consumer.connect();
    await consumer.subscribe({ topic, fromBeginning: false });

    consumer.run({
      eachMessage: async ({ topic, partition, message }) => {
        try {
          const parsed = JSON.parse(message.value.toString());
          if (Array.isArray(parsed)) {
            console.log(`📥 Received ${parsed.length} records from ${topic}`);
            await saveToDb(parsed);
          }
        } catch (err) {
          console.error('❌ Failed to parse or save message:', err);
        }
      },
    });
  }
}

runConsumers().catch(console.error);