const { pool } = require("../../utils/db");

/**
 * Get top-5 executives that have given the biggest amount of funds on a single Company organization.
 * @returns Message in case of failure, otherwise array of all executives & related company { executiveName, organizationName, totalAmount }
 */
module.exports.getFundingPerCompany = async (req, res) => {
  try {
    const executivesQuery = await pool.query(
      `SELECT e.name AS executiveName, m.organizationName AS companyName, SUM(p.budget) AS totalFundingAmount
      FROM executive AS e
      JOIN project AS p
        ON p.executiveId = e.id
      JOIN managed_by AS m
        ON p.id = m.projectId
      JOIN organization AS o
        ON o.name = m.organizationName
      WHERE o.category = 'Company'
      GROUP BY e.name, m.organizationName
      ORDER BY totalFundingAmount DESC
      LIMIT 5`,
      []
    );

    const executives = executivesQuery[0];

    return res.status(200).json({
      executives,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
