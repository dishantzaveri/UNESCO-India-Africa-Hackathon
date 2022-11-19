const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");

router.post("/exam/creation", async (req, res) => {
  //identify the partogram to connect
  const partogramuser = await partogram.findOne({
    firstName: req.body.firstName,
  });
  if (partogramuser) {
    const newExam = new exam({
      partogram: partogramuser._id,
    });

    console.log(newExam);
    try {
      const saveExam = await newExam.save(function (err, result) {
        if (err) {
          console.log(err);
        } else {
          console.log(result);
          res.status(200).json(result);
        }
      });
      // res.json({ newPartogram: newPartogram._id });
    } catch (err) {
      res.status(500).send(err);
    }
  }
});

module.exports = router;
