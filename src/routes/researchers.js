const express = require("express");

const {
  getResearchers,
} = require("../controllers/researchers/get-researchers");
const { getProjects } = require("../controllers/researchers/get-projects");

const router = express.Router();

router.get("/", getResearchers);
router.get("/projects/:researcherId", getProjects);

module.exports = router;
