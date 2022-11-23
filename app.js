const express = require("express");
const app = express();
const dotenv = require("dotenv");
const mongoose = require("mongoose");
const cors = require("cors");
const methodOverride = require("method-override");
var path = require("path");
const bodyParser = require("body-parser");
const patientAuth = require("./routes/patientAuth");
const refcenAuth = require("./routes/refcenAuth");
const partogramR = require("./routes/partogramR");
const examCreation = require("./routes/examCreation");
const fetusPlot = require("./routes/fetusPlot");
const sendPdf = require("./routes/sendpdf");
const fetchUser = require("./routes/fetchUser");
const amnfluidPlot = require("./routes/amnfluidPlot");
const interventionsPlot = require("./routes/interventionsPlot");
const labourPlot = require("./routes/labourPlot");
dotenv.config();

// MIDDLEWARE;
// app.use(bodyParser.urlencoded({ extended: false }));
// app.use(bodyParser.json());
app.use(bodyParser.json());
app.use(methodOverride("_method"));
app.use(express.json());
var corsOptions = {
  // in: null,
  methods: "GET, PUT",
  // optionsSuccessStatus: 200, // For legacy browser support
};
app.use(cors());
// app.use(express.static("public"));
app.use(express.json());

mongoose.connect(
  process.env.DB_CONNECT,
  { useNewUrlParser: true, useUnifiedTopology: true },
  () => console.log("connected to db")
);

//ROUTES MIDDLEWARE
app.use("/", patientAuth);
app.use("/", refcenAuth);
app.use("/", partogramR);
app.use("/", examCreation);
app.use("/", fetusPlot);
app.use("/", sendPdf);
app.use("/", fetchUser);
app.use("/", amnfluidPlot);
app.use("/", interventionsPlot);
app.use("/", labourPlot);
app.listen(process.env.PORT || 3000, () =>
  console.log("Server Up and running")
);
