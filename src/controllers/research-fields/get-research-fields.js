const { pool } = require("../../utils/db");

/**
 * Get all research fields in alphabetical order.
 * @returns Message in case of failure, otherwise array of all research fields { name }
 */
module.exports.getResearchFields = async (req, res) => {
  try {
    const researchFieldsQuery = await pool.query(
      `SELECT name FROM research_field ORDER BY name`,
      []
    );

    const researchFields = researchFieldsQuery[0];

    return res.status(200).json({
      researchFields,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
