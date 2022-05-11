const baseUrl = "http://localhost";
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const titleElement = document.querySelector(".title");
const wrapperDiv = document.querySelector(".researchers-wrapper");

let projectResearchers = null;

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
  const researchersHeaderRowGender = document.createElement("h4");
  researchersHeaderRowGender.innerHTML = "Gender";
  const researchersHeaderRowBirthDate = document.createElement("h4");
  researchersHeaderRowBirthDate.innerHTML = "Birth Date";

  researchersHeaderRow.appendChild(researchersHeaderRowName);
  researchersHeaderRow.appendChild(researchersHeaderRowSurname);
  researchersHeaderRow.appendChild(researchersHeaderRowGender);
  researchersHeaderRow.appendChild(researchersHeaderRowBirthDate);
  wrapperDiv.appendChild(researchersHeaderRow);

  // create list of researchers
  for (let researcher of projectResearchers) {
    const researcherRow = document.createElement("div");
    researcherRow.className = "researchers-row";
    const researcherName = document.createElement("p");
    researcherName.innerHTML = researcher.name;
    const researcherSurname = document.createElement("p");
    researcherSurname.innerHTML = researcher.surname;
    const researcherGender = document.createElement("p");
    researcherGender.innerHTML = researcher.gender;
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
    researcherRow.appendChild(researcherGender);
    researcherRow.appendChild(researcherBirthDate);
    wrapperDiv.appendChild(researcherRow);
  }
};

// After successfull request for project's name, construct the title
const setTitle = (title) => {
  titleElement.textContent = title;
};

// After successfull request for project's researchers, construct the list of researchers
const setProjectResearchersData = (responseProjectResearchers) => {
  projectResearchers = responseProjectResearchers;

  // clean the list's contents
  wrapperDiv.innerHTML = "";

  // error
  if (!projectResearchers) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (projectResearchers.length === 0) {
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
const getProjectResearchers = async (id) => {
  if (!id) return;

  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${baseUrl}/api/projects/researchers/${id}`;
    const response = await fetch(requestUrl);
    const { projectName, projectResearchers } = await response.json();
    setTitle(`Researchers working on project ${projectName}`);
    setProjectResearchersData(projectResearchers);
  } catch (e) {
    setTitle(`No data found for given project ${id}`);
    setProjectResearchersData();
  }
};

if (!urlParams || !urlParams.has("id")) {
  setTitle(
    "Invalid link. An ID is required in order to see the working researchers."
  );
}

getProjectResearchers(urlParams.get("id"));
