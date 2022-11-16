const router = require("express").Router();
const patient = require("../model/patient");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

router.post("/patient/register", async (req, res) => {
  // if patient exists
  // res.setHeader("Access-Control-Allow-Origin", "*");
  const patientEmailExist = await patient.findOne({ email: req.body.email });
  if (patientEmailExist) return res.status(400).send("email already exists");
  console.log("reached 2");

  // setTimeout(function () {
  //   mongoose.connect("mongodb://localhost:27017/myapp");
  // }, 60000);

  // bcrypt
  const salt = await bcrypt.genSalt(10);
  const hashPass = await bcrypt.hash(req.body.password, salt);

  // create new newowner
  const newPatient = new patient({
    username: req.body.username,
    email: req.body.email,
    password: hashPass,
  });
  console.log(newPatient);
  try {
    const savePatient = await newPatient.save(function (err, result) {
      if (err) {
        console.log(err);
      } else {
        console.log(result);
      }
    });
    res.json({ newPatient: newPatient._id });
  } catch (err) {
    res.status(500).send(err);
  }
});

// login
router.post("/patient/login", async (req, res) => {
  // if newowner exists
  const newPatient = await patient.findOne({ email: req.body.email });
  if (!newPatient)
    return res.status(400).json("password or email doesn't exists");

  // setTimeout(function () {
  //   mongoose.connect("mongodb://localhost:27017/myapp");
  // }, 60000);

  // password correct
  const validPass = await bcrypt.compare(
    req.body.password,
    newPatient.password
  );
  if (!validPass) return res.status(400).json("invalid password");

  // create jwt token and assign
  const token = jwt.sign({ _id: newPatient._id }, process.env.TOKEN_SECRET);
  res.header("auth-token", token).json(token);

  // res.send("logged in");
});

module.exports = router;
