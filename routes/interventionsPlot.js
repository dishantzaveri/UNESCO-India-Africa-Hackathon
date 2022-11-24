const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");
const interventions = require("../model/interventions");

router.post("/exam/interventions", async (req, res) => {
  //identify the partogram to connect
  const partogramuser = await partogram.findOne({
    firstName: req.body.firstName,
  });
  console.log(partogramuser);
  const examuser = await exam.findOne({
    partogram: partogramuser._id,
  });
  if (partogramuser) {
    const newInterventions = new interventions({
      dose: req.body.dose,
      time: req.body.time,
      route: req.body.route,
      exam: examuser._id,
    });

    try {
      const saveInterventions = await newInterventions.save();
      var saveInterventionsId = saveInterventions._id;

      const final = await examuser.interventions.push(saveInterventionsId);
      await examuser.save();
      res.status(200).json(newInterventions);
    } catch (err) {
      res.status(500).send(err);
    }
  }
});

module.exports = router;
