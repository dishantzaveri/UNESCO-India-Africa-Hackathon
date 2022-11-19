const man = require("mongoose");

var fetusSchema = new man.Schema({
  Heartbeat: { type: Number, required: true },
});

var fetusModel = man.model("fetus", fetusSchema);
module.exports = fetusModel;
