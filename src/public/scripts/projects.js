const baseUrl = "http://localhost";

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");

const dateFromInput = document.getElementById("date-from");
const dateToInput = document.getElementById("date-to");
const minDurationInput = document.getElementById("duration-min");
const maxDurationInput = document.getElementById("duration-max");
const executiveIdInput = document.getElementById("executive-id");

const tbl = document.createElement("table");
tbl.className = "projects-table";

const wrapperDiv = document.createElement("div");
wrapperDiv.className = "table-wrapper";

let projects = null;

/**
 * Handle click on a project
 * @param {number} id
 */
const navigateToProject = (id) => {
  if (!id) return;
  console.log(id);
};

/**
 * Change table's content
 */
const changeTablesContent = () => {
  // create table's head
  const tblHead = document.createElement("thead");
  tblHead.className = "table-head";
  const tblHeadRow = document.createElement("tr");
  tblHeadRow.className = "projects-row";
  const tblHeadTitle = document.createElement("th");
  tblHeadTitle.innerHTML = "Title";
  const tblHeadDescription = document.createElement("th");
  tblHeadDescription.innerHTML = "Description";
  const tblHeadBudget = document.createElement("th");
  tblHeadBudget.innerHTML = "Budget (€)";
  const tblHeadStartDate = document.createElement("th");
  tblHeadStartDate.innerHTML = "Start Date";
  const tblHeadEndDate = document.createElement("th");
  tblHeadEndDate.innerHTML = "End Date";
  const tblHeadDuration = document.createElement("th");
  tblHeadDuration.innerHTML = "Duration";

  tblHeadRow.appendChild(tblHeadTitle);
  tblHeadRow.appendChild(tblHeadDescription);
  tblHeadRow.appendChild(tblHeadBudget);
  tblHeadRow.appendChild(tblHeadStartDate);
  tblHeadRow.appendChild(tblHeadEndDate);
  tblHeadRow.appendChild(tblHeadDuration);
  tblHead.appendChild(tblHeadRow);
  tbl.appendChild(tblHead);

  // create table's body
  const tblBody = document.createElement("tbody");
  for (let project of projects) {
    const projectRow = document.createElement("tr");
    projectRow.className = "projects-row";
    const projectTitle = document.createElement("td");
    projectTitle.innerHTML = project.title;
    const projectDescription = document.createElement("td");
    projectDescription.innerHTML = project.description;
    const projectBudget = document.createElement("td");
    projectBudget.innerHTML = project.budget;
    const projectStartDate = document.createElement("td");
    const startDate = project.startDate ? new Date(project.startDate) : null;
    projectStartDate.innerHTML =
      startDate && !isNaN(startDate)
        ? startDate.toISOString().split("T")[0]
        : "-";
    const projectEndDate = document.createElement("td");
    const endDate = project.endDate ? new Date(project.endDate) : null;
    projectEndDate.innerHTML =
      endDate && !isNaN(endDate) ? endDate.toISOString().split("T")[0] : "-";
    const projectDuration = document.createElement("td");
    projectDuration.innerHTML = project.duration
      ? `${project.duration} years`
      : "-";

    projectRow.appendChild(projectTitle);
    projectRow.appendChild(projectDescription);
    projectRow.appendChild(projectBudget);
    projectRow.appendChild(projectStartDate);
    projectRow.appendChild(projectEndDate);
    projectRow.appendChild(projectDuration);
    projectRow.addEventListener("click", () => navigateToProject(project.id));
    tblBody.appendChild(projectRow);
  }

  tbl.appendChild(tblBody);
};

// After successfull request for projects, construct the table
const setProjectsData = (responseProjects) => {
  projects = responseProjects;

  // clean the table
  tbl.innerHTML = "";

  // error
  if (!projects) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (projects.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No projects found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  // create table
  changeTablesContent();

  wrapperDiv.appendChild(tbl);
  containerDiv.appendChild(wrapperDiv);
};

/**
 * Asynchronous function: Get all projects from API
 */
const getProjects = async () => {
  const dateFrom = dateFromInput?.value;
  const dateTo = dateToInput?.value;
  const minDuration = minDurationInput?.value;
  const maxDuration = maxDurationInput?.value;
  const executiveId =
    executiveIdInput?.options[executiveIdInput.selectedIndex]?.value;

  let queryParameters = {};
  let hasQueryParameters = false;
  if (dateFrom && !isNaN(new Date(dateFrom))) {
    queryParameters.dateFrom = dateFrom;
    hasQueryParameters = true;
  }
  if (dateTo && !isNaN(new Date(dateTo))) {
    queryParameters.dateTo = dateTo;
    hasQueryParameters = true;
  }
  if (minDuration) {
    queryParameters.minDuration = minDuration;
    hasQueryParameters = true;
  }
  if (maxDuration) {
    queryParameters.maxDuration = maxDuration;
    hasQueryParameters = true;
  }
  if (executiveId && executiveId > 0) {
    queryParameters.executiveId = executiveId;
    hasQueryParameters = true;
  }

  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${baseUrl}/api/projects${
      hasQueryParameters ? "?" + new URLSearchParams(queryParameters) : ""
    }`;
    const response = await fetch(requestUrl);
    const { projects } = await response.json();
    setProjectsData(projects);
  } catch (e) {
    setProjectsData();
  }
};

/**
 * Asynchronous function: Get all executives from API
 */
const getExecutives = async () => {
  try {
    const response = await fetch(`${baseUrl}/api/executives`);
    const { executives } = await response.json();
    for (let executive of executives) {
      const opt = document.createElement("option");
      opt.value = executive.id;
      opt.innerHTML = executive.name;
      executiveIdInput.appendChild(opt);
    }
  } catch (e) {}
};

getExecutives();
getProjects();

dateFromInput.addEventListener("change", getProjects);
dateToInput.addEventListener("change", getProjects);
minDurationInput.addEventListener("change", getProjects);
maxDurationInput.addEventListener("change", getProjects);
executiveIdInput.addEventListener("change", getProjects);
