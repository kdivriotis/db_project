const express = require("express");

const { getExecutives } = require("../controllers/executives/get-executives");
const {
  getFundingPerCompany,
} = require("../controllers/executives/get-funding-per-company");

const router = express.Router();

router.get("/", getExecutives);
router.get("/funding-per-company", getFundingPerCompany);

module.exports = router;
