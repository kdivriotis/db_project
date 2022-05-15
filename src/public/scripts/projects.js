const baseUrl = "http://localhost";

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const wrapperDiv = document.querySelector(".projects-wrapper");

const dateFromInput = document.querySelector("#date-from");
const dateToInput = document.querySelector("#date-to");
const minDurationInput = document.querySelector("#duration-min");
const maxDurationInput = document.querySelector("#duration-max");
const executiveIdInput = document.querySelector("#executive-id");

let projects = null;
let orderBy = { key: null, order: null };

/**
 * Handle click on a header item - Change sorting order of array
 * @param {string} orderSelection The element to sort the list of projects by
 */
const setOrderMethod = (orderSelection) => {
  const alterOrder = () => (orderBy.order === 1 ? 0 : 1);
  orderBy.order = orderBy.key === orderSelection ? alterOrder() : 0;
  orderBy.key = orderSelection;
};

/**
 * Handle click on a project
 * @param {number} id
 */
const navigateToProject = (id) => {
  if (!id) return;
  window.location.href = `${baseUrl}/projects/researchers?id=${id}`;
};

/**
 * Change wrapper div's content
 */
const changeProjectsContent = () => {
  // create projects' list header
  const projectsHeaderRow = document.createElement("div");
  projectsHeaderRow.className = "projects-row head";
  const headerRowElements = [];
  const projectsHeaderRowTitle = document.createElement("h4");
  projectsHeaderRowTitle.innerHTML = "Title";
  projectsHeaderRowTitle.dataset.name = "title";
  headerRowElements.push(projectsHeaderRowTitle);
  const projectsHeaderRowDescription = document.createElement("h4");
  projectsHeaderRowDescription.innerHTML = "Description";
  projectsHeaderRowDescription.dataset.name = "description";
  headerRowElements.push(projectsHeaderRowDescription);
  const projectsHeaderRowBudget = document.createElement("h4");
  projectsHeaderRowBudget.innerHTML = "Budget";
  projectsHeaderRowBudget.dataset.name = "budget";
  headerRowElements.push(projectsHeaderRowBudget);
  const projectsHeaderRowStartDate = document.createElement("h4");
  projectsHeaderRowStartDate.innerHTML = "Start Date";
  projectsHeaderRowStartDate.dataset.name = "startDate";
  headerRowElements.push(projectsHeaderRowStartDate);
  const projectsHeaderRowEndDate = document.createElement("h4");
  projectsHeaderRowEndDate.innerHTML = "End Date";
  projectsHeaderRowEndDate.dataset.name = "endDate";
  headerRowElements.push(projectsHeaderRowEndDate);
  const projectsHeaderRowDuration = document.createElement("h4");
  projectsHeaderRowDuration.innerHTML = "Duration";
  projectsHeaderRowDuration.dataset.name = "duration";
  headerRowElements.push(projectsHeaderRowDuration);

  const setHeaderRowElementsClassnames = () => {
    for (let headerRowElement of headerRowElements) {
      headerRowElement.className =
        headerRowElement.dataset.name === orderBy.key
          ? orderBy.order === 1
            ? "order-desc"
            : "order-asc"
          : "";
    }
  };

  for (let headerRowElement of headerRowElements) {
    headerRowElement.addEventListener("click", () => {
      setOrderMethod(headerRowElement.dataset.name);
      setHeaderRowElementsClassnames();
      getProjects();
    });
  }

  setHeaderRowElementsClassnames();

  projectsHeaderRow.appendChild(projectsHeaderRowTitle);
  projectsHeaderRow.appendChild(projectsHeaderRowDescription);
  projectsHeaderRow.appendChild(projectsHeaderRowBudget);
  projectsHeaderRow.appendChild(projectsHeaderRowStartDate);
  projectsHeaderRow.appendChild(projectsHeaderRowEndDate);
  projectsHeaderRow.appendChild(projectsHeaderRowDuration);
  wrapperDiv.appendChild(projectsHeaderRow);

  // create list of projects
  for (let project of projects) {
    const projectRow = document.createElement("div");
    projectRow.className = "projects-row";
    projectRow.setAttribute("tooltip", "Click to view related researchers");
    const projectTitle = document.createElement("p");
    projectTitle.innerHTML = project.title;
    const projectDescription = document.createElement("p");
    projectDescription.innerHTML = project.description;
    const projectBudget = document.createElement("p");
    projectBudget.innerHTML = `${project.budget} €`;
    const projectStartDate = document.createElement("p");
    const startDate = project.startDate ? new Date(project.startDate) : null;
    projectStartDate.innerHTML =
      startDate && !isNaN(startDate)
        ? startDate.toISOString().split("T")[0]
        : "-";
    const projectEndDate = document.createElement("p");
    const endDate = project.endDate ? new Date(project.endDate) : null;
    projectEndDate.innerHTML =
      endDate && !isNaN(endDate) ? endDate.toISOString().split("T")[0] : "-";
    const projectDuration = document.createElement("p");
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
    wrapperDiv.appendChild(projectRow);
  }
};

// After successfull request for projects, construct the list of projects
const setProjectsData = (responseProjects) => {
  projects = responseProjects;

  // clean the list's contents
  wrapperDiv.innerHTML = "";

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
  changeProjectsContent();
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
  if (orderBy?.key) {
    queryParameters.orderBy = orderBy.key;
    queryParameters.order = orderBy.order;
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
