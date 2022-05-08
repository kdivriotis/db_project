const express = require("express");

const { getPrograms } = require("../controllers/get-programs");

const router = express.Router();

router.get("/", getPrograms);

module.exports = router;
