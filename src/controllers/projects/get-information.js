const { pool } = require("../../utils/db");

/**
 * Get all information for a certain project.
 * @returns Message in case of failure, otherwise all information for given project.
 */
module.exports.getProjectInformation = async (req, res) => {
  const { projectId } = req.params;
  // check for validity of given id (return status 400 on failure)
  if (!projectId || projectId === 0) {
    return res.status(400).json({ message: "Invalid parameters" });
  }

  try {
    // get all project's information from the project_information view
    const projectInformationQuery = await pool.query(
      `SELECT *
        FROM project_information
        WHERE id=?`,
      [projectId]
    );

    const projectInformation = projectInformationQuery[0];

    // get project's deliverables
    const projectDeliverablesQuery = await pool.query(
      `SELECT title, description, delivery_date AS deliveryDate
        FROM deliverable
        WHERE projectId=?`,
      [projectId]
    );

    const projectDeliverables = projectDeliverablesQuery[0];

    return res.status(200).json({
      projectInformation,
      projectDeliverables,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
