const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");

router.post("/exam/uterine", async (req, res) => {
  //identify the partogram to connect
  const partogramuser = await partogram.findOne({
    firstName: req.body.firstName,
  });
  console.log(partogramuser);
  const examuser = await exam.findOne({
    partogram: partogramuser._id,
  });
  if (partogramuser) {
    try {
      const saveUterine = req.body.uterine;
      const final = await examuser.uterinecontraction.push(saveUterine);
      await examuser.save();
      res.status(200).json(saveUterine);
    } catch (err) {
      res.status(500).send(err);
    }
  }
});

module.exports = router;
