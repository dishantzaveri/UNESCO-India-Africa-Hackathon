const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");
const mother = require("../model/mother");

router.post("/exam/mother", async (req, res) => {
  //identify the partogram to connect
  const partogramuser = await partogram.findOne({
    firstName: req.body.firstName,
  });
  console.log(partogramuser);
  const examuser = await exam.findOne({
    partogram: partogramuser._id,
  });
  if (partogramuser) {
    const newMother = new mother({
      bp_lower: req.body.bp_lower,
      bp_upper: req.body.bp_upper,
      temperature: req.body.temperature,
      pulse: req.body.pulse,
      exam: examuser._id,
    });

    try {
      const saveMother = await newMother.save();
      console.log(examuser);

      // const saveit = await exam.updateOne(
      //   { _id: examuser._id },
      //   { $push: { mother: saveMother._id } }
      // );
      var saveMotherId = saveMother._id;

      const final = await examuser.mother.push(saveMotherId);
      await examuser.save();
      res.status(200).json(newMother);
    } catch (err) {
      res.status(500).send(err);
    }
  }
});

module.exports = router;
