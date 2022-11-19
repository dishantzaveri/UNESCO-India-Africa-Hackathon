const man = require("mongoose");

var interventionsSchema = new man.Schema({
  dose: { type: String, required: true },
  time: { type: String, required: true },
  route: { type: String, required: true },
});

var interventionsModel = man.model("interventions", interventionsSchema);
module.exports = interventionsModel;
