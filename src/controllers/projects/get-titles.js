const { pool } = require("../../utils/db");

/**
 * Get all available projects' titles, ordered in alphabetical order (by title).
 * @returns Message in case of failure, otherwise array of available projects { id, title }
 */
module.exports.getProjectTitles = async (req, res) => {
  try {
    // get researchers working on given project ID
    const projectTitlesQuery = await pool.query(
      `SELECT id, title
        FROM project
        ORDER BY title ASC`,
      []
    );

    const projects = projectTitlesQuery[0];

    return res.status(200).json({
      projects,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
