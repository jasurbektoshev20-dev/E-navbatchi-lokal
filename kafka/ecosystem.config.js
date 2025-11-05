module.exports = {
    apps: [{
        name: "kafka-consumer",
        script: "index.js",
        watch: true,
        ignore_watch: ["node_modules"],
    }]
};
