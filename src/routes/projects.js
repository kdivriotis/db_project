const express = require("express");

const { getProjects } = require("../controllers/get-projects");

const router = express.Router();

router.get("/", getProjects);

module.exports = router;
