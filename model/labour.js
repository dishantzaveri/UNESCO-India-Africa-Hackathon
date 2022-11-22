const man = require("mongoose");

var labourSchema = new man.Schema({
  dilation: { type: String, required: true },
  hours: { type: String, required: true },
  exam: {
    type: man.Schema.Types.ObjectId,
    ref: "exam",
  },
});

module.exports = man.model("labour", labourSchema);
