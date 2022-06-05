const { pool } = require("../../utils/db");

/**
 * Get all organizations' names.
 * @returns Message in case of failure, otherwise array of existing organizations { name }
 */
module.exports.getOrganizations = async (req, res) => {
  try {
    const organizationsQuery = await pool.query(
      `SELECT name FROM organization`,
      []
    );

    const organizations = organizationsQuery[0];

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
