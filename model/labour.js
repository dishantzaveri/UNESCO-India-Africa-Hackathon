const man = require("mongoose");

var labourSchema = new man.Schema({
  dilation: { type: String, required: true },
  hours: { type: String, required: true },
});

var labourModel = man.model("labour", labourSchema);
module.exports = labourModel;
