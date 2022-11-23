const router = require("express").Router();
const multer = require("./mulfile");
const pdf = require("./pdfmake.js");
const mail = require("nodemailer");

router.post("/partogram/sendpdf", multer, async (req, res) => {
  var partimg = req.file;

  let sendPdf = await pdf(partimg);
  var emailu = req.body.emailuser;
  var emailp = req.body.emailpatient;
  let mailTransporter = mail.createTransport({
    service: "gmail",
    auth: {
      user: "syntaxenemies04@gmail.com",
      //       pass: "Syntaxenemies@04",
      pass: "lmcogbmvruvmavsr",
    },
  });

  let mailDetails = {
    from: "test",
    to: emailu,
    emailp,
    subject: "Partogram alert",
    text: "You see My parotogram...",
    document: sendPdf,
  };

  mailTransporter.sendMail(mailDetails, function (err, data) {
    if (err) {
      console.log("Error Occurs");
      res.status(500).send(err);
    } else {
      console.log("Email sent successfully");
      res.status(200).json();
    }
  });
});

module.exports = router;
