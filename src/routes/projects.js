const express = require("express");

const { getProjects } = require("../controllers/get-projects");
const {
  getProjectResearchers,
} = require("../controllers/get-project-researchers");

const router = express.Router();

router.get("/", getProjects);
router.get("/researchers/:projectId", getProjectResearchers);

module.exports = router;
