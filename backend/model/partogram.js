const { Date } = require("mongoose");
const man = require("mongoose");

var partogramSchema = new man.Schema(
  {
    // idPart: Schema.ObjectId,
    // HospitalId: { type: String, required: true },
    // AdmissionDateTime: { type: Date, required: true },
    // TriggerMode: { type: String, required: true },
    // memRupTime: { type: String, required: true },
    marriedName: { type: String, required: true },
    // email: { type: String, required: true },
    // maiden: { type: String, required: true },
    firstName: { type: String, required: true },
    age: { type: String, required: true },
    parity: { type: Number, required: true },
    weight: { type: Number, required: true },
    size: { type: Number, required: true },
    exam: {
      type: man.Schema.Types.ObjectId,
      ref: "exam",
    },
  },
  { timestamps: true }
);

module.exports = man.model("partogram", partogramSchema);
