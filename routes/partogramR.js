const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");

router.post("/partogram/enter/headings", async (req, res) => {
  // create new partogram
  const newPartogram = new partogram({
    marriedName: req.body.marriedName,
    firstName: req.body.firstName,
    age: req.body.age,
    parity: req.body.parity,
    weight: req.body.weight,
    size: req.body.size,
  });
  console.log(newPartogram);
  try {
    const savePartogram = await newPartogram.save(function (err, result) {
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
});

module.exports = router;
