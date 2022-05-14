const express = require("express");

const {
  getResearchers,
} = require("../controllers/researchers/get-researchers");
const { getProjects } = require("../controllers/researchers/get-projects");
const {
  getYoungestResearchers,
} = require("../controllers/researchers/get-youngest-researchers");

const router = express.Router();

router.get("/", getResearchers);
router.get("/projects/:researcherId", getProjects);
router.get("/youngest", getYoungestResearchers);

module.exports = router;
