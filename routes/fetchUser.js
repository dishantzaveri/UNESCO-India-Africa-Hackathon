const router = require("express").Router();
const partogram = require("../model/partogram");
const exam = require("../model/exam");
const mongoose = require("mongoose");

router.get("/partogram/fetch", async (req, res) => {
  try {
    var newPart = await partogram.find({});
    var data = [];
    newPart.forEach((e) => data.push(e.firstName));
    res.status(200).json(data);
  } catch (err) {
    res.status(500).send(err);
  }
});

module.exports = router;
