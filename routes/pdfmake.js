const pdf = require("pdfmake");

function makePdf(image) {
  var docdef = {
    content: [{ text: "Partogram App..." }, { text: "There is an alert " }],
    Image: { image },
    pageSize: "A5",
    pageOrientation: "landscape",
    pageMargins: [40, 60, 40, 60],
  };
    let pdfDoc = pdf.createPdfKitDocument(docdef, {});
    var name = "partogram"+"_"+Date.now()
    pdfDoc.pipe(fs.createWriteStream('../uploads/pdfs/name'));
    pdfDoc.end();
  return pdf(docdef);
}

module.exports = makePdf;
