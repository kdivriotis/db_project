const { pool } = require("../utils/db");

/**
 * Get all executives.
 * @returns Message in case of failure, otherwise array of all executives { id, name }
 */
module.exports.getExecutives = async (req, res) => {
  try {
    const executivesQuery = await pool.query(
      `SELECT id, name FROM executive`,
      []
    );

    const executives = executivesQuery[0];

    return res.status(200).json({
      executives,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
