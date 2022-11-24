const router = require("express").Router();
const upload = require("express-fileupload");
const fs = require("fs");
const mail = require("nodemailer");
const url = require("url");

router.use(upload());

router.post("/partogram/sendpdf", async (req, res) => {
  //   let sendPdf = req.get({ uri: pdfURL, encoding: null });
  if (req.files) {
    console.log(req.files);
    var file = req.files.file;
    //     var filename = file.name;
    //     console.log(filename);

    // file.mv("./uploads/" + filename, function (err) {
    //   if (err) {
    //     res.send(err);
    //   } else {
    //     console.log("File uploaded");
    //   }
    // });
  }

  //   let sendFile = req.file;
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
    attachments: [
      {
        File: file,
        contentType: "application/pdf",
      },
    ],
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
