const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");
const fetus = require("../model/fetus");

router.post("/exam/fetus", async (req, res) => {
  //identify the partogram to connect
  const partogramuser = await partogram.findOne({
    firstName: req.body.firstName,
  });
  console.log(partogramuser);
  const examuser = await exam.findOne({
    partogram: partogramuser._id,
  });
  if (partogramuser) {
    const newFetus = new fetus({
      heartbeat: req.body.heartbeat,
      exam: examuser._id,
    });

    try {
      const saveFetus = await newFetus.save();
      console.log(examuser);

      // const saveit = await exam.updateOne(
      //   { _id: examuser._id },
      //   { $push: { fetus: saveFetus._id } }
      // );
      var saveFetusId = saveFetus._id;

      const final = await examuser.fetus.push(saveFetusId);
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
