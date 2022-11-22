const man = require("mongoose");

var amnfluidSchema = new man.Schema({
  fluid: { type: String, required: true },
  exam: {
    type: man.Schema.Types.ObjectId,
    ref: "exam",
  },
});

module.exports = man.model("amnfluid", amnfluidSchema);
