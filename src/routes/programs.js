const express = require("express");

const { getPrograms } = require("../controllers/programs/get-programs");

const router = express.Router();

router.get("/", getPrograms);

module.exports = router;
