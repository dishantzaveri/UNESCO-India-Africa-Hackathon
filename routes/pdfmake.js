const pdf = require("pdfmake");

function makePdf(image) {
  var docdef = {
    content: [{ text: "Partogram App..." }, { text: "There is an alert " }],
    Image: { image },
    pageSize: "A5",
    pageOrientation: "landscape",
    pageMargins: [40, 60, 40, 60],
  };
  return pdf(docdef);
}

module.exports = makePdf;
