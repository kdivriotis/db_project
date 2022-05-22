const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const wrapperDiv = document.querySelector(".wrapper");
const projectsWrapperDiv = document.querySelector(".projects-wrapper");
const profileCardDiv = document.querySelector(".profile-card");

const researcherNameInput = document.querySelector("#researcher-name");

let researcherProjects = null;

/**
 * Change projects div's content
 */
const changeProjectsContent = () => {
  // create projects' list header
  const projectsHeaderRow = document.createElement("div");
  projectsHeaderRow.className = "projects-row head";

  const projectsHeaderRowTitle = document.createElement("h4");
  projectsHeaderRowTitle.innerHTML = "Title";
  const projectsHeaderRowBudget = document.createElement("h4");
  projectsHeaderRowBudget.innerHTML = "Budget";
  const projectsHeaderRowStartDate = document.createElement("h4");
  projectsHeaderRowStartDate.innerHTML = "Start Date";
  const projectsHeaderRowEndDate = document.createElement("h4");
  projectsHeaderRowEndDate.innerHTML = "End Date";
  const projectsHeaderRowDuration = document.createElement("h4");
  projectsHeaderRowDuration.innerHTML = "Duration";

  projectsHeaderRow.appendChild(projectsHeaderRowTitle);
  projectsHeaderRow.appendChild(projectsHeaderRowBudget);
  projectsHeaderRow.appendChild(projectsHeaderRowStartDate);
  projectsHeaderRow.appendChild(projectsHeaderRowEndDate);
  projectsHeaderRow.appendChild(projectsHeaderRowDuration);
  projectsWrapperDiv.appendChild(projectsHeaderRow);

  // create list of projects
  for (let project of researcherProjects) {
    const projectRow = document.createElement("div");
    projectRow.className = "projects-row";
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
    const projectEndDate = document.createElement("p");
    const endDate = project.endDate ? new Date(project.endDate) : null;
    projectEndDate.innerHTML =
      endDate && !isNaN(endDate) ? endDate.toISOString().split("T")[0] : "-";
    const projectDuration = document.createElement("p");
    projectDuration.innerHTML = project.duration
      ? `${project.duration} years`
      : "-";

    projectRow.appendChild(projectTitle);
    projectRow.appendChild(projectBudget);
    projectRow.appendChild(projectStartDate);
    projectRow.appendChild(projectEndDate);
    projectRow.appendChild(projectDuration);
    projectsWrapperDiv.appendChild(projectRow);
  }
};

/**
 * Change researcher profile div's content
 */
const changeProfileContent = () => {
  // create researcher's profile card
  const { name, surname, gender, birthDate, age } = researcherProjects[0];
  const researcherNameDiv = document.createElement("div");
  researcherNameDiv.className = "profile-info";
  const researcherName = document.createElement("p");
  researcherName.innerHTML = "Name";
  const researcherNameValue = document.createElement("p");
  researcherNameValue.innerHTML = name;
  researcherNameDiv.appendChild(researcherName);
  researcherNameDiv.appendChild(researcherNameValue);

  const researcherSurnameDiv = document.createElement("div");
  researcherSurnameDiv.className = "profile-info";
  const researcherSurname = document.createElement("p");
  researcherSurname.innerHTML = "Surname";
  const researcherSurnameValue = document.createElement("p");
  researcherSurnameValue.innerHTML = surname;
  researcherSurnameDiv.appendChild(researcherSurname);
  researcherSurnameDiv.appendChild(researcherSurnameValue);

  const researcherGenderDiv = document.createElement("div");
  researcherGenderDiv.className = "profile-info";
  const researcherGender = document.createElement("p");
  researcherGender.innerHTML = "Gender";
  const researcherGenderValue = document.createElement("p");
  researcherGenderValue.innerHTML = gender;
  researcherGenderDiv.appendChild(researcherGender);
  researcherGenderDiv.appendChild(researcherGenderValue);

  const researcherBirthDateDiv = document.createElement("div");
  researcherBirthDateDiv.className = "profile-info";
  const researcherBirthDate = document.createElement("p");
  researcherBirthDate.innerHTML = "Birth Date";
  const researcherBirthDateValue = document.createElement("p");
  const tempBirthDate = birthDate ? new Date(birthDate) : null;
  researcherBirthDateValue.innerHTML =
    tempBirthDate && !isNaN(tempBirthDate)
      ? tempBirthDate.toISOString().split("T")[0]
      : "-";
  researcherBirthDateDiv.appendChild(researcherBirthDate);
  researcherBirthDateDiv.appendChild(researcherBirthDateValue);

  const researcherDurationDiv = document.createElement("div");
  researcherDurationDiv.className = "profile-info";
  const researcherDuration = document.createElement("p");
  researcherDuration.innerHTML = "Age";
  const researcherDurationValue = document.createElement("p");
  researcherDurationValue.innerHTML = age ? `${age} years old` : "-";
  researcherDurationDiv.appendChild(researcherDuration);
  researcherDurationDiv.appendChild(researcherDurationValue);

  profileCardDiv.appendChild(researcherNameDiv);
  profileCardDiv.appendChild(researcherSurnameDiv);
  profileCardDiv.appendChild(researcherGenderDiv);
  profileCardDiv.appendChild(researcherBirthDateDiv);
  profileCardDiv.appendChild(researcherDurationDiv);
};

// After successfull request for projects for selected researcher, construct the profile & list of projects
const setData = (responseProjects) => {
  researcherProjects = responseProjects;

  // clean the profile's & projects list's contents
  profileCardDiv.innerHTML = "";
  projectsWrapperDiv.innerHTML = "";

  // error
  if (!researcherProjects) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (researcherProjects.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No data found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  changeProjectsContent();
  changeProfileContent();
};

/**
 * Asynchronous function: Get all projects for selected researcher
 */
const getResearcherProjects = async () => {
  const researcherId =
    researcherNameInput?.options[researcherNameInput.selectedIndex]?.value;

  if (!researcherId) return;

  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${window.location.origin}/api/researchers/projects/${researcherId}`;
    const response = await fetch(requestUrl);
    const { researcherProjects } = await response.json();
    setData(researcherProjects);
  } catch (e) {
    setData();
  }
};

/**
 * Asynchronous function: Get all research fields from API
 */
const getResearchers = async () => {
  try {
    const response = await fetch(`${window.location.origin}/api/researchers`);
    const { researchers } = await response.json();
    for (let researcher of researchers) {
      const opt = document.createElement("option");
      opt.value = researcher.id;
      opt.innerHTML = `${researcher.name} ${researcher.surname}`;
      researcherNameInput.appendChild(opt);
    }
    getResearcherProjects();
  } catch (e) {}
};

getResearchers();

researcherNameInput.addEventListener("change", getResearcherProjects);
