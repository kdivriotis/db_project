const { pool } = require("../../utils/db");

/**
 * Get researchers working on at least 'limit' (default is 5) projects without deliverables.
 * @returns Message in case of failure, otherwise array of researchers { name, surname, numberOfProjects }
 */
module.exports.getNoDeliverablesProjects = async (req, res) => {
  let { limit } = req.params;
  if (!limit || parseInt(limit) < 1) limit = 5;

  try {
    const researchersQuery = await pool.query(
      `SELECT r.name, r.surname, COUNT(pr.projectId) AS projects
      FROM researcher AS r
      JOIN project_researchers AS pr
        ON r.id = pr.researcherId
      WHERE NOT EXISTS (
        SELECT d.projectId
          FROM deliverable AS d
          WHERE d.projectId = pr.projectId
      )
      GROUP BY r.id
      HAVING projects >= ?
      ORDER BY projects DESC`,
      [parseInt(limit)]
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
