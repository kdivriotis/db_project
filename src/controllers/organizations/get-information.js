const { pool } = require("../../utils/db");

/**
 * Get all information for a certain organization.
 * @returns Message in case of failure, otherwise all information for given organization.
 */
module.exports.getOrganizationInformation = async (req, res) => {
  const { organizationName } = req.params;
  // check for validity of given name (return status 400 on failure)
  if (!organizationName || organizationName.trim().length === 0) {
    return res.status(400).json({ message: "Invalid parameters" });
  }

  try {
    // get all organization's information
    const organizationInformationQuery = await pool.query(
      `SELECT o.name, o.abbreviation, o.street, o.number, o.postal_code AS postalCode, o.city, pn.phone, c.organizationName AS companyName, c.own_funds AS companyOwnFunds, rc.organizationName AS researchCenterName, rc.ministry_budget AS researchCenterMinistryBudget, rc.self_budget AS researchCenterSelfBudget, u.organizationName AS universityName, u.ministry_budget AS universityMinistryBudget
      FROM organization AS o
      JOIN phone_number AS pn
        ON pn.organizationName = o.name
      LEFT JOIN company AS c
        ON c.organizationName = o.name
      LEFT JOIN research_center AS rc
        ON rc.organizationName = o.name
      LEFT JOIN university AS u
        ON u.organizationName = o.name
      WHERE o.name=?`,
      [organizationName]
    );

    const organizationInformation = organizationInformationQuery[0];

    return res.status(200).json({
      organizationInformation,
    });
  } catch (error) {
    // On database failure, return
    return res
      .status(500)
      .json({ message: "Something went wrong, please try again" });
  }
};
