const express = require("express");

const {
  getResearchers,
} = require("../controllers/researchers/get-researchers");
const { getProjects } = require("../controllers/researchers/get-projects");
const {
  getYoungestResearchers,
} = require("../controllers/researchers/get-youngest-researchers");
const {
  getNoDeliverablesProjects,
} = require("../controllers/researchers/get-no-deliverables-projects");

const router = express.Router();

router.get("/", getResearchers);
router.get("/projects/:researcherId", getProjects);
router.get("/youngest", getYoungestResearchers);
router.get("/no-deliverables-projects/:limit?", getNoDeliverablesProjects);

module.exports = router;
