const { pool } = require("../../utils/db");

/**
 * Get top 3 most frequent pairs of fields research fields appearing in different interdisciplinary projects
 * @returns Message in case of failure, otherwise array of top 'limit' (default is 3) pairs { field1, field2, frequency }
 */
module.exports.getInterdisciplinaryFields = async (req, res) => {
  let { limit } = req.params;
  if (!limit || parseInt(limit) < 1) limit = 3;

  try {
    const interdisciplinaryFieldsQuery = await pool.query(
      `SELECT fieldRank, field1, field2, frequency
      FROM (
        SELECT RANK() OVER (ORDER BY frequency DESC) AS fieldRank, field1, field2, frequency
        FROM (
          SELECT rt1.research_fieldName AS field1, rt2.research_fieldName AS field2, COUNT(*) AS frequency
          FROM related_to rt1
          INNER JOIN related_to rt2
          ON rt1.research_fieldName < rt2.research_fieldName AND rt1.projectId = rt2.projectId
          GROUP BY rt1.research_fieldName, rt2.research_fieldName
        ) interdisciplinary_fields
      ) frequencies
      WHERE fieldRank <= ?
      ORDER BY fieldRank ASC, field1 ASC`,
      [parseInt(limit)]
    );

    const interdisciplinaryFields = interdisciplinaryFieldsQuery[0];

    return res.status(200).json({
      interdisciplinaryFields,
    });
  } catch (error) {
    console.log(error);
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
