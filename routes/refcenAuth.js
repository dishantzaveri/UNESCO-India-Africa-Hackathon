const router = require("express").Router();
const refcen = require("../model/refcen");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

router.post("/refcen/register", async (req, res) => {
  // if refcen exists
  // res.setHeader("Access-Control-Allow-Origin", "*");
  const refcenEmailExist = await refcen.findOne({ email: req.body.email });
  if (refcenEmailExist) return res.status(400).send("email already exists");
  console.log("reached 2");

  // setTimeout(function () {
  //   mongoose.connect("mongodb://localhost:27017/myapp");
  // }, 60000);

  // bcrypt
  const salt = await bcrypt.genSalt(10);
  const hashPass = await bcrypt.hash(req.body.password, salt);

  // create new newowner
  const newRefcen = new refcen({
    username: req.body.username,
    email: req.body.email,
    password: hashPass,
  });
  console.log(newRefcen);
  try {
    const saveRefcen = await newRefcen.save(function (err, result) {
      if (err) {
        console.log(err);
      } else {
        console.log(result);
      }
    });
    res.json({ newRefcen: newRefcen._id });
  } catch (err) {
    res.status(500).send(err);
  }
});

// login
router.post("/refcen/login", async (req, res) => {
  // if newowner exists
  const newRefcen = await refcen.findOne({ email: req.body.email });
  if (!newRefcen)
    return res.status(400).json("password or email doesn't exists");

  // setTimeout(function () {
  //   mongoose.connect("mongodb://localhost:27017/myapp");
  // }, 60000);

  // password correct
  const validPass = await bcrypt.compare(req.body.password, newRefcen.password);
  if (!validPass) return res.status(400).json("invalid password");

  // create jwt token and assign
  const token = jwt.sign({ _id: newRefcen._id }, process.env.TOKEN_SECRET);
  res.header("auth-token", token).json(token);

  // res.send("logged in");
});

module.exports = router;
