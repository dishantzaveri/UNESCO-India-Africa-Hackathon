const multer = require("multer");

const MIME_TYPES = {
  "image/jpg": "jpg",
  "image/jpeg": "jpg",
  "image/png": "png",
};

const dir = multer.diskStorage({
  destination: (req, file, callback) => {
    callback(
      null,
      "E:\\PROJECTS\\Partogram_UIA\\partogram_uia2\\UNESCO-India-Africa-Hackathon\\uploads"
    );
  },
  filename: (req, file, callback) => {
    const name = file.originalname.split(" ").join("_");
    const extension = MIME_TYPES[file.mimetype];
    callback(null, name);
  },
});

module.exports = multer({ storage: dir }).single("file");
