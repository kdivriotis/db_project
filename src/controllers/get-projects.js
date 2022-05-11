const { pool } = require("../utils/db");

/**
 * Get all available projects.
 * @param {string | null} dateFrom The date since which we want the projects' start date to be from
 * @param {string | null} dateTo The date until which we want the projects' start date to be from
 * @param {number | null} minDuration The minimum duration we want the projects to have
 * @param {number | null} maxDuration The maximum duration we want the projects to have
 * @param {number | null} executiveId The unique id of the executive that handles the funding
 * @param {Object} orderBy The selected filter to order results by
 * @returns Message in case of failure, otherwise array of available programs { id, title, description, budget, startDate, endDate, duration }
 */
module.exports.getProjects = async (req, res) => {
  const orderByMappings = {
    title: "title",
    description: "description",
    budget: "budget",
    startDate: "startDate",
    endDate: "endDate",
    duration: "duration",
  };

  try {
    // get selected parameters from request's body (if they exist)
    const {
      dateFrom,
      dateTo,
      minDuration,
      maxDuration,
      executiveId,
      orderBy,
      order,
    } = req.query;

    // initial structure of the SQL query to get
    let queryText = `SELECT id, title, description, budget, start_date AS startDate, end_date AS endDate, duration FROM project`;
    let queryParametersStr = [];
    let queryParameters = [];
    // check if dateFrom is given and valid
    if (dateFrom && !isNaN(new Date(dateFrom))) {
      queryParametersStr.push("start_date >= ?");
      queryParameters.push(dateFrom);
    }
    // check if dateTo is given and valid
    if (dateTo && !isNaN(new Date(dateTo))) {
      queryParametersStr.push("start_date <= ?");
      queryParameters.push(dateTo);
    }
    // check if minDuration is given and valid
    if (minDuration && minDuration > 0) {
      queryParametersStr.push("duration >= ?");
      queryParameters.push(minDuration);
    }
    // check if maxDuration is given and valid
    if (maxDuration && maxDuration > (minDuration ? minDuration : 0)) {
      queryParametersStr.push("duration <= ?");
      queryParameters.push(maxDuration);
    }
    // check if executiveId is given and valid
    if (executiveId && executiveId > 0) {
      queryParametersStr.push("executiveId = ?");
      queryParameters.push(executiveId);
    }

    // build the final query string with parameters (if any)
    if (queryParametersStr.length > 0)
      queryText = `${queryText} WHERE ${queryParametersStr.join(" AND ")}`;

    // check if orderBy is given and valid
    if (orderBy && orderByMappings[orderBy]) {
      queryText = `${queryText} ORDER BY ${orderByMappings[orderBy]} ${
        parseInt(order) === 1 ? "DESC" : "ASC"
      }`;
    }

    const projectsQuery = await pool.query(queryText, queryParameters);

    const projects = projectsQuery[0];

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
