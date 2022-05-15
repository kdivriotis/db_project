const express = require("express");

const {
  getResearchFields,
} = require("../controllers/research-fields/get-research-fields");
const {
  getRelatedProjects,
} = require("../controllers/research-fields/get-related-projects");
const {
  getInterdisciplinaryFields,
} = require("../controllers/research-fields/get-interdisciplinary-fields");

const router = express.Router();

router.get("/", getResearchFields);
router.get("/related-projects/:name", getRelatedProjects);
router.get("/interdisciplinary/:limit?", getInterdisciplinaryFields);

module.exports = router;
