const baseUrl = "http://localhost";
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const titleElement = document.querySelector(".title");

const dateFromInput = document.getElementById("date-from");
const dateToInput = document.getElementById("date-to");
const minDurationInput = document.getElementById("duration-min");
const maxDurationInput = document.getElementById("duration-max");
const executiveIdInput = document.getElementById("executive-id");

const tbl = document.createElement("table");
tbl.className = "researchers-table";

const wrapperDiv = document.createElement("div");
wrapperDiv.className = "table-wrapper";

let projectResearchers = null;

/**
 * Change table's content
 */
const changeTablesContent = () => {
  // create table's head
  const tblHead = document.createElement("thead");
  tblHead.className = "table-head";
  const tblHeadRow = document.createElement("tr");
  tblHeadRow.className = "researchers-row";
  const tblHeadName = document.createElement("th");
  tblHeadName.innerHTML = "Name";
  const tblHeadSurname = document.createElement("th");
  tblHeadSurname.innerHTML = "Surname";
  const tblHeadGender = document.createElement("th");
  tblHeadGender.innerHTML = "Gender";
  const tblHeadBirthDate = document.createElement("th");
  tblHeadBirthDate.innerHTML = "Birth Date";

  tblHeadRow.appendChild(tblHeadName);
  tblHeadRow.appendChild(tblHeadSurname);
  tblHeadRow.appendChild(tblHeadGender);
  tblHeadRow.appendChild(tblHeadBirthDate);
  tblHead.appendChild(tblHeadRow);
  tbl.appendChild(tblHead);

  // create table's body
  const tblBody = document.createElement("tbody");
  for (let researcher of projectResearchers) {
    const researcherRow = document.createElement("tr");
    researcherRow.className = "researchers-row";
    const researcherName = document.createElement("td");
    researcherName.innerHTML = researcher.name;
    const researcherSurname = document.createElement("td");
    researcherSurname.innerHTML = researcher.surname;
    const researcherGender = document.createElement("td");
    researcherGender.innerHTML = researcher.gender;
    const researcherBirthDate = document.createElement("td");
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
    tblBody.appendChild(researcherRow);
  }

  tbl.appendChild(tblBody);
};

// After successfull request for project's name, construct the title
const setTitle = (title) => {
  titleElement.textContent = title;
};

// After successfull request for project's researchers, construct the table
const setProjectResearchersData = (responseProjectResearchers) => {
  projectResearchers = responseProjectResearchers;

  // clean the table
  tbl.innerHTML = "";

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

  // create table
  changeTablesContent();

  wrapperDiv.appendChild(tbl);
  containerDiv.appendChild(wrapperDiv);
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
