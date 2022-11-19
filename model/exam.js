const man = require("mongoose");
const amnfluid = require("../model/amnfluid");

var examSchema = new man.Schema({
  // idExam: Schema.ObjectId,
  // time: { type: Time, required: true },
  fetus: [
    {
      // PresentationType: { type: String, required: true },
      // PresentationVariety: { type: String, required: true },
      // PresentationLevel: { type: Number, required: true },
      // Heartbeat: { type: Number, required: true },
      type: man.Schema.Types.ObjectId,
      ref: "fetusModel",
    },
  ],
  amnfluid: [
    {
      type: man.Schema.Types.ObjectId,
      ref: "amnfluidModel",
    },
  ],

  // watersBag: {
  //   Status: String,
  //   LiquidQuantity: { type: Number, required: true, default: 0 },
  //   LiquidAppearance: { type: Number, required: true, default: "none" },
  // },
  // cervicalMonitoring: {
  //   position: { type: String, required: true },
  //   dilatation: { type: Number, required: true },
  // },
  labour: [
    {
      // dilation: { type: String, required: true },
      // hours: { type: String, required: true },
      type: man.Schema.Types.ObjectId,
      ref: "labourModel",
    },
  ],
  uterinecontraction: [{ type: Number, required: true }],
  interventions: [
    {
      // dose: { type: String, required: true },
      // time: { type: String, required: true },
      // route: { type: String, required: true },
      type: man.Schema.Types.ObjectId,
      ref: "interventionsModel",
    },
  ],
  mother: [
    {
      // behaviour: { type: String, required: true },
      // painEvaluation: { type: Number, min: 0, max: 10, required: true },
      // bp_lower: { type: Number, required: true },
      // bp_upper: { type: Number, required: true },
      // temperature: { type: Number, required: true },
      // pulse: { type: Number, required: true },
      type: man.Schema.Types.ObjectId,
      ref: "motherModel",
    },
  ],
});

var examModel = man.model("exam", examSchema);
module.exports = examModel;
