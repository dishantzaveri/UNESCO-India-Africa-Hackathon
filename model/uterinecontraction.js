const man = require("mongoose");

var uterinecontractionSchema = new man.Schema({
  contraction: { type: String, required: true },
});

var uterinecontractionModel = man.model(
  "uterinecontraction",
  uterinecontractionSchema
);
module.exports = uterinecontractionModel;
