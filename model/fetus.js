const man = require("mongoose");

var fetusSchema = new man.Schema({
  heartbeat: { type: Number, required: true },
  exam: {
    type: man.Schema.Types.ObjectId,
    ref: "exam",
  },
});

module.exports = man.model("fetus", fetusSchema);
