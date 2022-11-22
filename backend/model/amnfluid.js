const man = require("mongoose");

var amnfluidSchema = new man.Schema({
  fluid: { type: String, required: true },
});

module.exports = man.model("amnfluid", amnfluidSchema);
