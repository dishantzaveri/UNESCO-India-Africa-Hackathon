const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");
const fetus = require("../model/fetus");
const amnfluid = require("../model/amnfluid");
const labour = require("../model/labour");
const interventions = require("../model/interventions");
const mother = require("../model/mother");
const merge = require("deepmerge");

router.post("/exam/creation", async (req, res) => {
  //identify the partogram to connect
  const partogramuser = await partogram.findOne({
    firstName: req.body.firstName,
  });
  if (partogramuser) {
    var dataToSend;
    const newFetus = new fetus({
      heartbeat: req.body.heartbeat,
    });

    const newAmnfluid = new amnfluid({
      fluid: req.body.fluid,
    });

    const newLabour = new labour({
      dilation: req.body.dilation,
      hours: req.body.hours,
    });

    const newInterventions = new interventions({
      dose: req.body.dose,
      time: req.body.time,
      route: req.body.route,
    });

    const newMother = new mother({
      bp_lower: req.body.bp_lower,
      bp_upper: req.body.bp_upper,
      temperature: req.body.temperature,
      pulse: req.body.pulse,
    });

    const newExam = new exam({
      partogram: partogramuser._id,
      fetus: newFetus._id,
      amnfluid: newAmnfluid._id,
      labour: newLabour._id,
      uterinecontraction: req.body.uterinecontraction,
      interventions: newInterventions._id,
      mother: newMother._id,
    });

    newMother.exam = newExam._id;
    newInterventions.exam = newExam._id;
    newLabour.exam = newExam._id;
    newAmnfluid.exam = newExam._id;
    newFetus.exam = newExam._id;
    // partogramuser.exam = newExam._id;

    console.log(newExam);
    try {
      const saveFetus = await newFetus.save();
      const saveAmnfluid = await newAmnfluid.save();
      const saveLabour = await newLabour.save();
      const saveInterventions = await newInterventions.save();
      const saveMother = await newMother.save();
      const saveExam = await newExam.save();
      res.status(200).send({
        saveFetus,
        saveAmnfluid,
        saveLabour,
        saveInterventions,
        saveMother,
        saveExam,
      });
    } catch (err) {
      res.status(500).send(err);
    }
  }
});

module.exports = router;
