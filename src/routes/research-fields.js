const express = require("express");

const {
  getResearchFields,
} = require("../controllers/research-fields/get-research-fields");
const {
  getRelatedProjects,
} = require("../controllers/research-fields/get-related-projects");

const router = express.Router();

router.get("/", getResearchFields);
router.get("/related-projects/:name", getRelatedProjects);

module.exports = router;
