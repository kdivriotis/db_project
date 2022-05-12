const { pool } = require("../../utils/db");

/**
 * Get all active projects and researchers for given research field in alphabetical order.
 * @returns Message in case of failure, otherwise arrays of projects and researchers
 */
module.exports.getRelatedProjects = async (req, res) => {
  // get research field's name from URL parameters
  const { name } = req.params;
  // check for validity of given id (return status 400 on failure)
  if (!name === 0) {
    return res.status(400).json({ message: "Invalid parameters" });
  }

  try {
    const projectsQuery = await pool.query(
      `SELECT p.id, p.title, p.budget, p.start_date AS startDate
      FROM project AS p
      WHERE p.id IN (
          SELECT rt.projectId
          FROM related_to AS rt
          WHERE rt.research_fieldName = ?
      ) AND p.duration IS NULL;`,
      [name]
    );

    const projects = projectsQuery[0];

    // if no projects found, return with error
    if (!projects || projects.length === 0) {
      return res.status(400).json({
        message: "No active projects found for the given research field",
      });
    }

    const researchersQuery = await pool.query(
      `SELECT DISTINCT(r.id), r.name, r.surname, r.birth_date AS birthDate
        FROM researcher AS r
        WHERE r.id IN (
            SELECT pr.researcherId
            FROM project_researchers AS pr
            WHERE pr.projectId IN (?)
        )
        ORDER BY r.name`,
      [projects.map((project) => project.id).join(",")]
    );

    const researchers = researchersQuery[0];

    return res.status(200).json({
      projects,
      researchers,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
