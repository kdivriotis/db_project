const express = require("express");
const path = require("path");

const router = express.Router();

// Home page (programs.html)
router.get(/^\/(programs(\.html)?)?$/, (req, res) => {
  return res.sendFile(path.join(__dirname, "..", "views", "programs.html"));
});

// Projects page (projects.html)
router.get(/^\/projects(\.html)?$/, (req, res) => {
  return res.sendFile(path.join(__dirname, "..", "views", "projects.html"));
});

// Researchers per Project page (project-researchers.html)
router.get(/^\/projects\/researchers(\.html)?(\?id=[0-9]+)?$/, (req, res) => {
  return res.sendFile(
    path.join(__dirname, "..", "views", "project-researchers.html")
  );
});

// Project's information page (projects.html)
router.get(/^\/projects\/information(\.html)?(\?id=[0-9]+)?$/, (req, res) => {
  return res.sendFile(path.join(__dirname, "..", "views", "project-info.html"));
});

// Projects per Researcher page (projects-per-researcher.html)
router.get(/^\/researchers\/projects(\.html)?$/, (req, res) => {
  return res.sendFile(
    path.join(__dirname, "..", "views", "projects-per-researcher.html")
  );
});

// Young researchers working on active projects (young-researchers.html)
router.get(/^\/researchers\/young(\.html)?$/, (req, res) => {
  return res.sendFile(
    path.join(__dirname, "..", "views", "young-researchers.html")
  );
});

// Researchers working on projects with no deliverables (researchers-no-deliverables.html)
router.get(/^\/researchers\/no-deliverables(\.html)?$/, (req, res) => {
  return res.sendFile(
    path.join(__dirname, "..", "views", "researchers-no-deliverables.html")
  );
});

// Research fields & related active projects/researchers page (research-fields.html)
router.get(/^\/research-fields(\.html)?$/, (req, res) => {
  return res.sendFile(
    path.join(__dirname, "..", "views", "research-fields.html")
  );
});

// Most common pairs of research fields appearing on interdisciplinary projects (interdisciplinary-fields.html)
router.get(/^\/research-fields\/interdisciplinary(\.html)?$/, (req, res) => {
  return res.sendFile(
    path.join(__dirname, "..", "views", "interdisciplinary-fields.html")
  );
});

// Executives (executive-funding-per-company.html)
router.get(/^\/executives\/funding-per-company(\.html)?$/, (req, res) => {
  return res.sendFile(
    path.join(__dirname, "..", "views", "executive-funding-per-company.html")
  );
});

// Organization detailed information (organization-info.html)
router.get(/^\/organizations\/information(\.html)?$/, (req, res) => {
  return res.sendFile(
    path.join(__dirname, "..", "views", "organization-info.html")
  );
});

// Organizations with same number of projects over two years (organization-projects.html)
router.get(/^\/organizations\/same-projects(\.html)?$/, (req, res) => {
  return res.sendFile(
    path.join(__dirname, "..", "views", "organization-projects.html")
  );
});

// Not found (404.html)
router.get(/^\/.*/, (req, res) => {
  return res.sendFile(path.join(__dirname, "..", "views", "404.html"));
});

module.exports = router;
