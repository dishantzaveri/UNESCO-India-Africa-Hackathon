const man = require("mongoose");

var amnfluidSchema = new man.Schema({
  fluid: { type: String, required: true },
});

var amnfluidModel = man.model("amnfluid", amnfluidSchema);
module.exports = amnfluidModel;
