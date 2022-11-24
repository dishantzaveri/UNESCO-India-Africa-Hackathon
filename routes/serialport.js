// var serialport = require("serialport");
// var SerialPort = serialport.SerialPort;
// var portName = process.argv[2];

// var myPort = new SerialPort(portName, {
//   baudRate: 9600,
//   parser: serialport.parsers.readline("\r\n"),
// });

// myPort.on("open", anOpen);
// myPort.on("data", anData);

// function anOpen() {
//   console.log("open connection");
// }

// function anData(data) {
//   console.log("data: " + JSON.stringify(data));
// }

// var http = require("http");
// var fs = require("fs");
// var index = fs.readFileSync("index.html");

var SerialPort = require("serialport");
const parsers = SerialPort.parsers;

const parser = new parsers.Readline({
  delimiter: "\r\n",
});

var port = new SerialPort("/dev/tty.wchusbserialfa1410", {
  baudRate: 9600,
  dataBits: 8,
  parity: "none",
  stopBits: 1,
  flowControl: false,
});

port.pipe(parser);

// var app = http.createServer(function (req, res) {
//   res.writeHead(200, { "Content-Type": "text/html" });
//   res.end(index);
// });

// var io = require("socket.io").listen(app);

// io.on("connection", function (socket) {
//   console.log("Node is listening to port");
// });

parser.on("data", function (data) {
  console.log("Received data from port: " + data);
  //   io.emit("data", data);
});

// app.listen(3000);
