const express = require("express");

const { getProjects } = require("../controllers/projects/get-projects");
const {
  getProjectResearchers,
} = require("../controllers/projects/get-project-researchers");
const { getProjectTitles } = require("../controllers/projects/get-titles");
const {
  getProjectInformation,
} = require("../controllers/projects/get-information");

const router = express.Router();

router.get("/", getProjects);
router.get("/researchers/:projectId", getProjectResearchers);
router.get("/titles", getProjectTitles);
router.get("/information/:projectId", getProjectInformation);

module.exports = router;
