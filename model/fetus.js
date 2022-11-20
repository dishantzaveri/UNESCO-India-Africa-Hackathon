const man = require("mongoose");

var fetusSchema = new man.Schema({
  heartbeat: { type: Number, required: true },
});

module.exports = man.model("fetus", fetusSchema);
