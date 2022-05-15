const baseUrl = "http://localhost";

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const wrapperDiv = document.querySelector(".researchers-wrapper");

let researchers = null;
let limit = 5;

/**
 * Change wrapper div's content
 */
const changeResearchersContent = () => {
  // create researchers' list header
  const researchersHeaderRow = document.createElement("div");
  researchersHeaderRow.className = "researchers-row head";
  const researchersHeaderRowName = document.createElement("h4");
  researchersHeaderRowName.innerHTML = "Name";
  const researchersHeaderRowSurname = document.createElement("h4");
  researchersHeaderRowSurname.innerHTML = "Surname";
  const researchersHeaderRowNumberOfProjects = document.createElement("h4");
  researchersHeaderRowNumberOfProjects.innerHTML =
    "Projects with no Deliverables";

  researchersHeaderRow.appendChild(researchersHeaderRowName);
  researchersHeaderRow.appendChild(researchersHeaderRowSurname);
  researchersHeaderRow.appendChild(researchersHeaderRowNumberOfProjects);
  wrapperDiv.appendChild(researchersHeaderRow);

  // create list of researchers
  for (let researcher of researchers) {
    const researcherRow = document.createElement("div");
    researcherRow.className = "researchers-row";
    const researcherName = document.createElement("p");
    researcherName.innerHTML = researcher.name;
    const researcherSurname = document.createElement("p");
    researcherSurname.innerHTML = researcher.surname;
    const researcherNumberOfProjects = document.createElement("p");
    researcherNumberOfProjects.innerHTML = researcher.projects;

    researcherRow.appendChild(researcherName);
    researcherRow.appendChild(researcherSurname);
    researcherRow.appendChild(researcherNumberOfProjects);
    wrapperDiv.appendChild(researcherRow);
  }
};

// After successfull request for researchers working on projects with no deliverables, construct the list of researchers
const setResearchersData = (responseResearchers) => {
  researchers = responseResearchers;

  // clean the list's contents
  wrapperDiv.innerHTML = "";

  // error
  if (!researchers) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (researchers.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No researchers found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  // create list
  changeResearchersContent();
};

/**
 * Asynchronous function: Get all projects from API
 */
const getProjectResearchers = async () => {
  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${baseUrl}/api/researchers/no-deliverables-projects/${limit}`;
    const response = await fetch(requestUrl);
    const { researchers } = await response.json();
    setResearchersData(researchers);
  } catch (e) {
    setResearchersData();
  }
};

getProjectResearchers();
