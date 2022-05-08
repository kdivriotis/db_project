const { pool } = require("../utils/db");

/**
 * Get all available programs.
 * @returns Message in case of failure, otherwise array of available programs { id, name, address }
 */
module.exports.getPrograms = async (req, res) => {
  try {
    const programsQuery = await pool.query(
      `SELECT id, name, address FROM program`,
      []
    );

    const programs = programsQuery[0];

    return res.status(200).json({
      programs,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
