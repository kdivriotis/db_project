const express = require("express");

const { getExecutives } = require("../controllers/get-executives");

const router = express.Router();

router.get("/", getExecutives);

module.exports = router;
