const baseUrl = "http://localhost";

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const tbl = document.createElement("table");
tbl.className = "programs-table";

const searchInput = document.createElement("input");
searchInput.placeholder = "Search for program...";
searchInput.className = "search-input";
searchInput.type = "text";

const wrapperDiv = document.createElement("div");
wrapperDiv.className = "table-wrapper";

let programs = null;

/**
 * Change table's content
 * @param {string | null} filter The string filter (optional) to be applied to the names of the read programs
 */
const changeTablesContent = (filter = undefined) => {
  // filter programs by name, if filter is given
  let filteredPrograms =
    !filter || filter.trim().length === 0
      ? programs
      : programs.filter((program) =>
          program.name.toLowerCase().includes(filter.trim())
        );

  // create table's head
  const tblHead = document.createElement("thead");
  tblHead.className = "table-head";
  const tblHeadRow = document.createElement("tr");
  tblHeadRow.className = "programs-row";
  const tblHeadName = document.createElement("th");
  tblHeadName.innerHTML = "Name";
  const tblHeadAddress = document.createElement("th");
  tblHeadAddress.innerHTML = "Address";

  tblHeadRow.appendChild(tblHeadName);
  tblHeadRow.appendChild(tblHeadAddress);
  tblHead.appendChild(tblHeadRow);
  tbl.appendChild(tblHead);

  // create table's body
  const tblBody = document.createElement("tbody");
  for (let program of filteredPrograms) {
    const programRow = document.createElement("tr");
    programRow.className = "programs-row";
    const programName = document.createElement("td");
    programName.innerHTML = program.name;
    const programAddress = document.createElement("td");
    programAddress.innerHTML = program.address;

    programRow.appendChild(programName);
    programRow.appendChild(programAddress);
    tblBody.appendChild(programRow);
  }

  tbl.appendChild(tblBody);
};

// After successfull request for programs, construct the table and search input
const setProgramsData = (responsePrograms) => {
  programs = responsePrograms;

  // clean the table
  tbl.innerHTML = "";

  // error
  if (!programs) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (programs.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No programs found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  containerDiv.appendChild(searchInput);

  // create table
  changeTablesContent();

  wrapperDiv.appendChild(tbl);
  containerDiv.appendChild(wrapperDiv);
};

/**
 * Asynchronous function: Get available programs from API
 */
const getPrograms = async () => {
  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const response = await fetch(`${baseUrl}/api/programs`);
    const { programs } = await response.json();
    setProgramsData(programs);
  } catch (e) {
    setProgramsData();
  }
};

getPrograms();

searchInput.addEventListener("input", (event) => {
  const searchText = event.target.value;
  changeTablesContent(searchText);
});
