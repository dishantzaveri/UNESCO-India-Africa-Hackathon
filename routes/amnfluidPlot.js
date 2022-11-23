const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");
const amnfluid = require("../model/amnfluid");

router.post("/exam/amnfluid", async (req, res) => {
  //identify the partogram to connect
  const partogramuser = await partogram.findOne({
    firstName: req.body.firstName,
  });
  console.log(partogramuser);
  const examuser = await exam.findOne({
    partogram: partogramuser._id,
  });
  if (partogramuser) {
    const newAmnfluid = new amnfluid({
      fluid: req.body.fluid,
      exam: examuser._id,
    });

    try {
      const saveAmnfluid = await newAmnfluid.save();
      var saveAmnId = saveAmnfluid._id;

      const final = await examuser.amnfluid.push(saveAmnId);
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
