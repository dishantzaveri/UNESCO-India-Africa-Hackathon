const man = require("mongoose");

var labourSchema = new man.Schema({
  dilation: { type: String, required: true },
  hours: { type: String, required: true },
});

module.exports = man.model("labour", labourSchema);
