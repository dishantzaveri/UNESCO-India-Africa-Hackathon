const { Date } = require("mongoose");
const man = require("mongoose");

var partogramSchema = new man.Schema({
  idPart: Schema.ObjectId,
  HospitalId: { type: String, required: true },
  AdmissionDateTime: { type: Date, required: true },
  TriggerMode: { type: String, required: true },
  MemRupTime: { type: Time, required: true },
  MarriedName: { type: String, required: true },
  Maiden: { type: String, required: true },
  FirstName: { type: String, required: true },
  DateBirth: { type: Date, required: true },
  Parity: { type: String, required: true },
  Weight: { type: Number, required: true },
  size: { type: Number, required: true },
});

var partogramModel = man.model("partogram", partogramSchema);
module.exports = partogramModel;
