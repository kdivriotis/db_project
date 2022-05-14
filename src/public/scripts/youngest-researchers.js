const baseUrl = "http://localhost";

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const wrapperDiv = document.querySelector(".researchers-wrapper");

let youngestResearchers = null;

/**
 * Change wrapper div's content
 */
const changeYoungestResearchersContent = () => {
  // create researchers' list header
  const researchersHeaderRow = document.createElement("div");
  researchersHeaderRow.className = "researchers-row head";
  const researchersHeaderRowName = document.createElement("h4");
  researchersHeaderRowName.innerHTML = "Name";
  const researchersHeaderRowSurname = document.createElement("h4");
  researchersHeaderRowSurname.innerHTML = "Surname";
  const researchersHeaderRowAge = document.createElement("h4");
  researchersHeaderRowAge.innerHTML = "Age";
  const researchersHeaderRowNumberOfProjects = document.createElement("h4");
  researchersHeaderRowNumberOfProjects.innerHTML = "Number of Active Projects";

  researchersHeaderRow.appendChild(researchersHeaderRowName);
  researchersHeaderRow.appendChild(researchersHeaderRowSurname);
  researchersHeaderRow.appendChild(researchersHeaderRowAge);
  researchersHeaderRow.appendChild(researchersHeaderRowNumberOfProjects);
  wrapperDiv.appendChild(researchersHeaderRow);

  // create list of researchers
  for (let researcher of youngestResearchers) {
    const researcherRow = document.createElement("div");
    researcherRow.className = "researchers-row";
    const researcherName = document.createElement("p");
    researcherName.innerHTML = researcher.name;
    const researcherSurname = document.createElement("p");
    researcherSurname.innerHTML = researcher.surname;
    const researcherAge = document.createElement("p");
    researcherAge.innerHTML = `${researcher.age} years old`;
    const researcherNumberOfProjects = document.createElement("p");
    researcherNumberOfProjects.innerHTML = researcher.numberOfProjects;

    researcherRow.appendChild(researcherName);
    researcherRow.appendChild(researcherSurname);
    researcherRow.appendChild(researcherAge);
    researcherRow.appendChild(researcherNumberOfProjects);
    wrapperDiv.appendChild(researcherRow);
  }
};

// After successfull request for youngest researchers, construct the list of researchers
const setYoungestResearchersData = (responseYoungestResearchers) => {
  youngestResearchers = responseYoungestResearchers;

  // clean the list's contents
  wrapperDiv.innerHTML = "";

  // error
  if (!youngestResearchers) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (youngestResearchers.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No researchers found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  // create list
  changeYoungestResearchersContent();
};

/**
 * Asynchronous function: Get all projects from API
 */
const getProjectResearchers = async () => {
  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${baseUrl}/api/researchers/youngest`;
    const response = await fetch(requestUrl);
    const { youngestResearchers } = await response.json();
    setYoungestResearchersData(youngestResearchers);
  } catch (e) {
    setYoungestResearchersData();
  }
};

getProjectResearchers();
