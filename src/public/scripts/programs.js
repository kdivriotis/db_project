const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const wrapperDiv = document.querySelector(".programs-wrapper");
const searchInput = document.querySelector(".search-input");

let programs = null;

/**
 * Change wrapper div's content
 * @param {string | null} filter The string filter (optional) to be applied to the names of the read programs
 */
const changeProgramsContent = (filter = undefined) => {
  // clean the list's contents
  wrapperDiv.innerHTML = "";

  // filter programs by name, if filter is given
  let filteredPrograms =
    !filter || filter.trim().length === 0
      ? programs
      : programs.filter((program) =>
          program.name.toLowerCase().includes(filter.trim())
        );

  // create programs' list header
  const programsHeaderRow = document.createElement("div");
  programsHeaderRow.className = "programs-row head";
  const programsHeaderRowName = document.createElement("h4");
  programsHeaderRowName.innerHTML = "Name";
  const programsHeaderRowAddress = document.createElement("h4");
  programsHeaderRowAddress.innerHTML = "Address";

  programsHeaderRow.appendChild(programsHeaderRowName);
  programsHeaderRow.appendChild(programsHeaderRowAddress);
  wrapperDiv.appendChild(programsHeaderRow);

  // create list of programs
  for (let program of filteredPrograms) {
    const programRow = document.createElement("div");
    programRow.className = "programs-row";
    const programName = document.createElement("p");
    programName.innerHTML = program.name;
    const programAddress = document.createElement("p");
    programAddress.innerHTML = program.address;

    programRow.appendChild(programName);
    programRow.appendChild(programAddress);
    wrapperDiv.appendChild(programRow);
  }
};

// After successfull request for programs, construct the list of programs and search input
const setProgramsData = (responsePrograms) => {
  programs = responsePrograms;

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
  searchInput.className = "search-input";

  // create prorgams list
  changeProgramsContent();
};

/**
 * Asynchronous function: Get available programs from API
 */
const getPrograms = async () => {
  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const response = await fetch(`${window.location.origin}/api/programs`);
    const { programs } = await response.json();
    setProgramsData(programs);
  } catch (e) {
    setProgramsData();
  }
};

getPrograms();

searchInput.addEventListener("input", (event) => {
  const searchText = event.target.value;
  changeProgramsContent(searchText);
});
