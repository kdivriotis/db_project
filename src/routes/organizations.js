const express = require("express");

const {
  getSameProjects,
} = require("../controllers/organizations/get-same-projects");

const router = express.Router();

router.get("/same-projects-over-2-years", getSameProjects);

module.exports = router;
