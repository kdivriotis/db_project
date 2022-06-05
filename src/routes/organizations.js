const express = require("express");

const {
  getOrganizations,
} = require("../controllers/organizations/get-organizations");
const {
  getSameProjects,
} = require("../controllers/organizations/get-same-projects");
const {
  getOrganizationInformation,
} = require("../controllers/organizations/get-information");

const router = express.Router();

router.get("/", getOrganizations);
router.get("/same-projects-over-2-years", getSameProjects);
router.get("/information/:organizationName", getOrganizationInformation);

module.exports = router;
