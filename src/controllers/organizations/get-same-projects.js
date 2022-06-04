const { pool } = require("../../utils/db");

/**
 * Get organizations having the same number of projects over 2 years (with at least 10 projects per year).
 * @returns Message in case of failure, otherwise array of all organizations having
 * the same number of projects over two consecutive years { organizationName, yearFrom, yearTo, numberOfProjects }
 */
module.exports.getSameProjects = async (req, res) => {
  try {
    const organizationsSameProjectsQuery = await pool.query(
      `WITH projects_per_year AS (
        SELECT mb.organizationName AS organizationName, YEAR(p.start_date) AS year, COUNT(*) AS numberOfProjects
        FROM managed_by AS mb
        JOIN project AS p
          ON p.id = mb.projectId
        GROUP BY mb.organizationName, YEAR(p.start_date)
        ORDER BY numberOfProjects DESC
      )
      SELECT ppy1.organizationName, ppy1.year AS yearFrom, ppy2.year AS yearTo, ppy1.numberOfProjects
      FROM projects_per_year AS ppy1
      JOIN projects_per_year AS ppy2
        ON ppy1.organizationName = ppy2.organizationName AND ppy1.year = ppy2.year - 1 AND ppy1.numberOfProjects = ppy2.numberOfProjects
      WHERE ppy1.numberOfProjects >= 10`,
      []
    );

    const organizations = organizationsSameProjectsQuery[0];

    return res.status(200).json({
      organizations,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
