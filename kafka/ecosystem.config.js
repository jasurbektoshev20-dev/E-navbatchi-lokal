module.exports = {
  apps: [{
    name: "kafka-consumer",
    script: "index.js",
    watch: false, // ❗ O‘CHIR
    max_restarts: 5,
    restart_delay: 5000
  }]
};
