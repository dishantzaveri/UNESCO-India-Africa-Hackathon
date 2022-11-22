const router = require("express").Router();
const cap = require('nightmare');
const multer = require("./mulfile");
const pdf = require('./pdfmake');
const mail = require('nodemailer');

router.post("/partogram/enter/headings", multer, async (req, res) => {
    var partimg = req.file;

    let sendPdf = await pdf.makePdf(partimg);
    var emailu = req.body.emailuser;
    var emailp = req.body.emailpatient;
    let mailTransporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: 'test',
                pass: 'test'
            }
        });
         
        let mailDetails = {
            from: 'test',
            to: emailu,emailp,
            subject: 'Partogram alert',
            text: 'You see My parotogram...',
        document: sendPdf 
        };
         
        mailTransporter.sendMail(mailDetails, function(err, data) {
            if(err) {
                console.log('Error Occurs');
                res.status(500).send(err);
            } else {
                console.log('Email sent successfully');
                res.status(200);
            }
        });
});
