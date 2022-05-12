const express = require("express");

const { getExecutives } = require("../controllers/executives/get-executives");

const router = express.Router();

router.get("/", getExecutives);

module.exports = router;
