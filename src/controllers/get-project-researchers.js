const { pool } = require("../utils/db");

/**
 * Get all available projects.
 * @param {number} projectId The project's unique ID for which we want to get the researchers that work for it
 * @returns Message in case of failure, otherwise array of working researchers { id, title, description, budget, startDate, endDate, duration }
 */
module.exports.getProjectResearchers = async (req, res) => {
  try {
    // get projectId and projectName from URL parameters
    const { projectId } = req.params;
    // check for validity of given id (return status 400 on failure)
    if (!projectId || projectId === 0) {
      return res.status(400).json({ message: "Invalid parameters" });
    }

    // get project's name (just for display)
    const projectNameQuery = await pool.query(
      `SELECT title FROM project WHERE id=?`,
      [projectId]
    );

    // if name wasn't found, return with error (invalid project ID)
    if (!projectNameQuery[0]?.length > 0) {
      return res.status(400).json({ message: "Invalid parameters" });
    }

    const { title: projectName } = projectNameQuery[0][0];

    // get researchers working on given project ID
    const projectReasearchersQuery = await pool.query(
      `SELECT researcher.name, researcher.surname, researcher.gender, researcher.birth_date AS birthDate
      FROM researcher
      WHERE researcher.id IN (
        SELECT project_researchers.researcherId
        FROM project_researchers
        WHERE project_researchers.projectId=?
      )`,
      [projectId]
    );

    const projectResearchers = projectReasearchersQuery[0];

    return res.status(200).json({
      projectName,
      projectResearchers,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
