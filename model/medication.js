const man = require("mongoose");

var medSchema = new man.Schema({
  idMed: Schema.ObjectId,
  name: { type: String, required: true },
  administrator: { type: String, required: true },
  administionRoute: { type: String, required: true },
  dosage: { type: Number, required: true },
});

var medModel = man.model("medication", medSchema);
module.exports = medModel;
