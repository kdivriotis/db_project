const { pool } = require("../../utils/db");

/**
 * Get all researchers from projects per researcher view.
 * @returns Message in case of failure, otherwise array of all researchers { id, name, surname }
 */
module.exports.getResearchers = async (req, res) => {
  try {
    const researchersuery = await pool.query(
      `SELECT DISTINCT(id), name, surname
      FROM projects_per_researcher
      ORDER BY name ASC, surname ASC`,
      []
    );

    const researchers = researchersQuery[0];

    return res.status(200).json({
      researchers,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
