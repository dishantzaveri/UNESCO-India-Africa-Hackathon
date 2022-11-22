const man = require("mongoose");

var uterinecontractionSchema = new man.Schema({
  contraction: { type: String, required: true },
});

module.exports = man.model("uterinecontraction", uterinecontractionSchema);
