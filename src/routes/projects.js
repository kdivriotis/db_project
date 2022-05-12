const express = require("express");

const { getProjects } = require("../controllers/projects/get-projects");
const {
  getProjectResearchers,
} = require("../controllers/projects/get-project-researchers");

const router = express.Router();

router.get("/", getProjects);
router.get("/researchers/:projectId", getProjectResearchers);

module.exports = router;
