const man = require("mongoose");

var interventionsSchema = new man.Schema({
  dose: { type: String, required: true },
  time: { type: String, required: true },
  route: { type: String, required: true },
  exam: {
    type: man.Schema.Types.ObjectId,
    ref: "exam",
  },
});

module.exports = man.model("interventions", interventionsSchema);
