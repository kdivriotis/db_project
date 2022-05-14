const { pool } = require("../../utils/db");

/**
 * Get youngest researchers (under age 40) working on active projects.
 * @returns Message in case of failure, otherwise array of researchers { name, surname, age, numberOfProjects }
 */
module.exports.getYoungestResearchers = async (req, res) => {
  try {
    const youngestResearchersQuery = await pool.query(
      `SELECT r.name, r.surname, TIMESTAMPDIFF(YEAR, r.birth_date, CURDATE()) AS age, COUNT(r.id) AS numberOfProjects
      FROM project_researchers AS pr
      JOIN researcher AS r
          ON pr.researcherId = r.id
      JOIN project AS p
          ON pr.projectId = p.id
      WHERE p.duration IS NULL
      GROUP BY r.name
      HAVING age < 40
      ORDER BY numberOfProjects DESC`,
      []
    );

    const youngestResearchers = youngestResearchersQuery[0];

    return res.status(200).json({
      youngestResearchers,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
