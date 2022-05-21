const baseUrl = "http://localhost";

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const wrapperDiv = document.querySelector(".wrapper");
const projectsTitle = document.querySelector("#projects-title");
const projectsWrapperDiv = document.querySelector(".projects-wrapper");
const researchersTitle = document.querySelector("#researchers-title");
const researchersWrapperDiv = document.querySelector(".researchers-wrapper");

const researchFieldInput = document.querySelector("#research-field-name");

let projects = null;
let researchers = null;

/**
 * Handle click on a project
 * @param {number} id
 */
const navigateToProject = (id) => {
  if (!id) return;
  window.location.href = `${baseUrl}/projects/information?id=${id}`;
};

/**
 * Change projects div's content
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
  const projectsHeaderRowBudget = document.createElement("h4");
  projectsHeaderRowBudget.innerHTML = "Budget";
  projectsHeaderRowBudget.dataset.name = "budget";
  headerRowElements.push(projectsHeaderRowBudget);
  const projectsHeaderRowStartDate = document.createElement("h4");
  projectsHeaderRowStartDate.innerHTML = "Start Date";
  projectsHeaderRowStartDate.dataset.name = "startDate";
  headerRowElements.push(projectsHeaderRowStartDate);

  projectsHeaderRow.appendChild(projectsHeaderRowTitle);
  projectsHeaderRow.appendChild(projectsHeaderRowBudget);
  projectsHeaderRow.appendChild(projectsHeaderRowStartDate);
  projectsWrapperDiv.appendChild(projectsHeaderRow);

  // create list of projects
  for (let project of projects) {
    const projectRow = document.createElement("div");
    projectRow.className = "projects-row";
    projectRow.setAttribute("tooltip", "Click to view project's information");
    const projectTitle = document.createElement("p");
    projectTitle.innerHTML = project.title;
    const projectBudget = document.createElement("p");
    projectBudget.innerHTML = `${project.budget} €`;
    const projectStartDate = document.createElement("p");
    const startDate = project.startDate ? new Date(project.startDate) : null;
    projectStartDate.innerHTML =
      startDate && !isNaN(startDate)
        ? startDate.toISOString().split("T")[0]
        : "-";

    projectRow.appendChild(projectTitle);
    projectRow.appendChild(projectBudget);
    projectRow.appendChild(projectStartDate);
    projectRow.addEventListener("click", () => navigateToProject(project.id));
    projectsWrapperDiv.appendChild(projectRow);
  }
};

/**
 * Change researchers div's content
 */
const changeResearchersContent = () => {
  // create researchers' list header
  const researchersHeaderRow = document.createElement("div");
  researchersHeaderRow.className = "researchers-row head";
  const headerRowElements = [];
  const researchersHeaderRowName = document.createElement("h4");
  researchersHeaderRowName.innerHTML = "Name";
  researchersHeaderRowName.dataset.name = "Name";
  headerRowElements.push(researchersHeaderRowName);
  const researchersHeaderRowSurname = document.createElement("h4");
  researchersHeaderRowSurname.innerHTML = "Surname";
  researchersHeaderRowSurname.dataset.surname = "Surname";
  headerRowElements.push(researchersHeaderRowSurname);
  const researchersHeaderRowBirthDate = document.createElement("h4");
  researchersHeaderRowBirthDate.innerHTML = "Birth Date";
  researchersHeaderRowBirthDate.dataset.name = "birthDate";
  headerRowElements.push(researchersHeaderRowBirthDate);

  researchersHeaderRow.appendChild(researchersHeaderRowName);
  researchersHeaderRow.appendChild(researchersHeaderRowSurname);
  researchersHeaderRow.appendChild(researchersHeaderRowBirthDate);
  researchersWrapperDiv.appendChild(researchersHeaderRow);

  // create list of researchers
  for (let researcher of researchers) {
    const researcherRow = document.createElement("div");
    researcherRow.className = "researchers-row";
    const researcherName = document.createElement("p");
    researcherName.innerHTML = researcher.name;
    const researcherSurname = document.createElement("p");
    researcherSurname.innerHTML = researcher.surname;
    const researcherBirthDate = document.createElement("p");
    const birthDate = researcher.birthDate
      ? new Date(researcher.birthDate)
      : null;
    researcherBirthDate.innerHTML =
      birthDate && !isNaN(birthDate)
        ? birthDate.toISOString().split("T")[0]
        : "-";

    researcherRow.appendChild(researcherName);
    researcherRow.appendChild(researcherSurname);
    researcherRow.appendChild(researcherBirthDate);
    researchersWrapperDiv.appendChild(researcherRow);
  }
};

// After successfull request for projects, construct the lists of projects and researchers
const setData = (responseProjects, responseResearchers) => {
  projects = responseProjects;
  researchers = responseResearchers;

  projectsTitle.innerHTML =
    projects?.length > 0 ? `Projects (${projects.length})` : "Projects";
  researchersTitle.innerHTML =
    researchers?.length > 0
      ? `Researchers (${researchers.length})`
      : "Researchers";

  // clean the lists' contents
  projectsWrapperDiv.innerHTML = "";
  researchersWrapperDiv.innerHTML = "";

  // error
  if (!projects || !researchers) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (projects.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No data found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  changeProjectsContent();
  changeResearchersContent();
};

/**
 * Asynchronous function: Get all active projects and researchers related to selected research field from API
 */
const getRelatedProjectsAndResearchers = async () => {
  const fieldName =
    researchFieldInput?.options[researchFieldInput.selectedIndex]?.value;

  if (!fieldName) return;

  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${baseUrl}/api/research-fields/related-projects/${fieldName}`;
    const response = await fetch(requestUrl);
    const { projects, researchers } = await response.json();
    setData(projects, researchers);
  } catch (e) {
    setData();
  }
};

/**
 * Asynchronous function: Get all research fields from API
 */
const getResearchFields = async () => {
  try {
    const response = await fetch(`${baseUrl}/api/research-fields`);
    const { researchFields } = await response.json();
    for (let researchField of researchFields) {
      const opt = document.createElement("option");
      opt.value = researchField.name;
      opt.innerHTML = `${researchField.name} (${researchField.frequency})`;
      researchFieldInput.appendChild(opt);
    }
    getRelatedProjectsAndResearchers();
  } catch (e) {}
};

getResearchFields();

researchFieldInput.addEventListener("change", getRelatedProjectsAndResearchers);
