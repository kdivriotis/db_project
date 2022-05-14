const { pool } = require("../../utils/db");

/**
 * Get all researchers from projects per researcher view.
 * @returns Message in case of failure, otherwise array of all researchers { id, name, surname }
 */
module.exports.getProjects = async (req, res) => {
  // get researcherId from URL parameters
  const { researcherId } = req.params;
  // check for validity of given id (return status 400 on failure)
  if (!researcherId || researcherId === 0) {
    return res.status(400).json({ message: "Invalid parameters" });
  }

  try {
    const researcherProjectsQuery = await pool.query(
      `SELECT name, surname, gender, birth_date AS birthDate, TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age, 
        project_title AS title, project_start_date AS startDate, project_end_date AS endDate, project_duration AS duration
      FROM projects_per_researcher
      WHERE id = ?
      ORDER BY startDate ASC`,
      []
    );

    const researcherProjects = researcherProjectsQuery[0];

    return res.status(200).json({
      researcherProjects,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
