const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");
const labour = require("../model/labour");

router.post("/exam/labour", async (req, res) => {
  //identify the partogram to connect
  const partogramuser = await partogram.findOne({
    firstName: req.body.firstName,
  });
  console.log(partogramuser);
  const examuser = await exam.findOne({
    partogram: partogramuser._id,
  });
  if (partogramuser) {
    const newlabour = new labour({
      dilation: req.body.dilation,
      hours: req.body.hours,
      exam: examuser._id,
    });

    try {
      const saveLabour = await newlabour.save();
      var saveLabourId = saveLabour._id;

      const final = await examuser.labour.push(saveLabourId);
      await examuser.save();
      res.status(200).json({
        examuser,
      });
    } catch (err) {
      res.status(500).send(err);
    }
  }
});

module.exports = router;
