const man = require("mongoose");

var motherSchema = new man.Schema({
  bp_lower: { type: Number, required: true },
  bp_upper: { type: Number, required: true },
  temperature: { type: Number, required: true },
  pulse: { type: Number, required: true },
});

var motherModel = man.model("mother", motherSchema);
module.exports = motherModel;
