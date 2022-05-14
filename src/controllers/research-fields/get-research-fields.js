const { pool } = require("../../utils/db");

/**
 * Get all research fields sorted by popularity.
 * @returns Message in case of failure, otherwise array of all research fields { name, frequency }
 */
module.exports.getResearchFields = async (req, res) => {
  try {
    const researchFieldsQuery = await pool.query(
      `SELECT rf.name, COUNT(*) AS frequency
      FROM related_to AS rt
      JOIN research_field AS rf
      ON rf.name = rt.research_fieldName
      JOIN project AS p
      ON rt.projectId = p.id
      WHERE p.duration IS NULL
      GROUP BY rt.research_fieldName
      ORDER BY frequency DESC, name ASC`,
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
