const man = require("mongoose");

var interventionsSchema = new man.Schema({
  dose: { type: String, required: true },
  time: { type: String, required: true },
  route: { type: String, required: true },
});

module.exports = man.model("interventions", interventionsSchema);
