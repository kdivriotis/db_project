const baseUrl = "http://localhost";
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const projectTitleInput = document.querySelector("#project-title");
const projectInfoWrapperDiv = document.querySelector(".project-info-wrapper");
const projectDetailsWrapperDiv = document.querySelector(
  ".project-details-wrapper"
);
const wrapperDiv = document.querySelector(".wrapper");
const deliverablesWrapperDiv = document.querySelector(".deliverables-wrapper");

let projectId = null;

/**
 * Change project info wrapper div's content
 */
const changeProjectInfoContent = ({
  title,
  description,
  budget,
  startDate,
  endDate,
  duration,
}) => {
  // create header
  const projectInfoHeaderRow = document.createElement("div");
  projectInfoHeaderRow.className = "project-info-row head";
  const projectInfoHeaderRowTitle = document.createElement("h4");
  projectInfoHeaderRowTitle.innerHTML = "Title";
  const projectInfoHeaderRowDescription = document.createElement("h4");
  projectInfoHeaderRowDescription.innerHTML = "Description";
  const projectInfoHeaderRowBudget = document.createElement("h4");
  projectInfoHeaderRowBudget.innerHTML = "Budget";
  const projectInfoHeaderRowStartDate = document.createElement("h4");
  projectInfoHeaderRowStartDate.innerHTML = "Start Date";
  const projectInfoHeaderRowEndDate = document.createElement("h4");
  projectInfoHeaderRowEndDate.innerHTML = "End Date";
  const projectInfoHeaderRowDuration = document.createElement("h4");
  projectInfoHeaderRowDuration.innerHTML = "Duration";

  projectInfoHeaderRow.appendChild(projectInfoHeaderRowTitle);
  projectInfoHeaderRow.appendChild(projectInfoHeaderRowDescription);
  projectInfoHeaderRow.appendChild(projectInfoHeaderRowBudget);
  projectInfoHeaderRow.appendChild(projectInfoHeaderRowStartDate);
  projectInfoHeaderRow.appendChild(projectInfoHeaderRowEndDate);
  projectInfoHeaderRow.appendChild(projectInfoHeaderRowDuration);
  projectInfoWrapperDiv.appendChild(projectInfoHeaderRow);

  // display project's info
  const projectInfoRow = document.createElement("div");
  projectInfoRow.className = "project-info-row";
  const projectTitle = document.createElement("p");
  projectTitle.innerHTML = title;
  const projectDescription = document.createElement("p");
  projectDescription.innerHTML = description;
  const projectBudget = document.createElement("p");
  projectBudget.innerHTML = `${budget} €`;
  const projectStartDate = document.createElement("p");
  const tempStartDate = startDate ? new Date(startDate) : null;
  projectStartDate.innerHTML =
    tempStartDate && !isNaN(tempStartDate)
      ? tempStartDate.toISOString().split("T")[0]
      : "-";
  const projectEndDate = document.createElement("p");
  const tempEndDate = endDate ? new Date(endDate) : null;
  projectEndDate.innerHTML =
    tempEndDate && !isNaN(tempEndDate)
      ? tempEndDate.toISOString().split("T")[0]
      : "-";
  const projectDuration = document.createElement("p");
  projectDuration.innerHTML = duration ? `${duration} years` : "-";

  projectInfoRow.appendChild(projectTitle);
  projectInfoRow.appendChild(projectDescription);
  projectInfoRow.appendChild(projectBudget);
  projectInfoRow.appendChild(projectStartDate);
  projectInfoRow.appendChild(projectEndDate);
  projectInfoRow.appendChild(projectDuration);
  projectInfoWrapperDiv.appendChild(projectInfoRow);
};

/**
 * Change project details wrapper div's content (executive, program, rating)
 */
const changeProjectDetailsContent = ({
  executiveName,
  programName,
  programAddress,
  rating,
  ratingDate,
  ratingResearcherName,
  ratingResearcherSurname,
}) => {
  // create executive container div & data
  const executiveContainer = document.createElement("div");
  executiveContainer.className = "detail-wrapper";
  const executiveContainerTitle = document.createElement("h3");
  executiveContainerTitle.innerHTML = "EL.ID.EK's Executive Manager";
  const executiveContainerName = document.createElement("p");
  executiveContainerName.className = "main";
  executiveContainerName.innerHTML = executiveName;
  executiveContainer.appendChild(executiveContainerTitle);
  executiveContainer.appendChild(executiveContainerName);

  // create program container div & data
  const programContainer = document.createElement("div");
  programContainer.className = "detail-wrapper";
  const programContainerTitle = document.createElement("h3");
  programContainerTitle.innerHTML = "Funded by Program";
  const programContainerName = document.createElement("p");
  programContainerName.className = "main";
  programContainerName.innerHTML = programName;
  const programContainerAddress = document.createElement("p");
  programContainerAddress.innerHTML = programAddress;
  programContainer.appendChild(programContainerTitle);
  programContainer.appendChild(programContainerName);
  programContainer.appendChild(programContainerAddress);

  // create rating container div & data
  const ratingContainer = document.createElement("div");
  ratingContainer.className = "detail-wrapper";
  const ratingContainerTitle = document.createElement("h3");
  const tempRatingDate = ratingDate ? new Date(ratingDate) : null;
  const tempRatingDateStr =
    tempRatingDate && !isNaN(tempRatingDate)
      ? tempRatingDate.toISOString().split("T")[0]
      : "-";
  ratingContainerTitle.innerHTML = `Rated by ${ratingResearcherName} ${ratingResearcherSurname} (on ${tempRatingDateStr})`;
  const ratingContainerValue = document.createElement("p");
  ratingContainerValue.className = "main";
  ratingContainerValue.innerHTML = `${rating}/10`;
  const ratingContainerIcons = document.createElement("div");
  ratingContainerIcons.className = "rating";
  for (let i = 0; i < 10; i++) {
    const ratingStar = document.createElement("span");
    if (i < parseInt(rating)) ratingStar.className = "fa-solid fa-star";
    else ratingStar.className = "fa-regular fa-star";
    ratingContainerIcons.appendChild(ratingStar);
  }

  ratingContainer.appendChild(ratingContainerTitle);
  ratingContainer.appendChild(ratingContainerValue);
  ratingContainer.appendChild(ratingContainerIcons);

  projectDetailsWrapperDiv.appendChild(executiveContainer);
  projectDetailsWrapperDiv.appendChild(programContainer);
  projectDetailsWrapperDiv.appendChild(ratingContainer);
};

/**
 * Change managing researcher's information card
 */
const changeResearchManagerInfoContent = ({
  researchManagerName,
  researchManagerSurname,
  researchManagerGender,
  researchManagerBirthDate,
}) => {
  // create researchManager div & data
  const researchManagerContainer = document.createElement("div");
  researchManagerContainer.className = "research-manager-card";
  const researchManagerContainerTitle = document.createElement("h3");
  researchManagerContainerTitle.innerHTML = "Research Manager";
  const researchManagerContainerName = document.createElement("p");
  researchManagerContainerName.className = "main";
  researchManagerContainerName.innerHTML = `${researchManagerName} ${researchManagerSurname}`;
  const researchManagerContainerGender = document.createElement("p");
  researchManagerContainerGender.className = "secondary";
  researchManagerContainerGender.innerHTML = researchManagerGender;
  const researchManagerContainerBirthDate = document.createElement("p");
  const tempBirthDate = researchManagerBirthDate
    ? new Date(researchManagerBirthDate)
    : null;
  const tempBirthDateStr =
    tempBirthDate && !isNaN(tempBirthDate)
      ? tempBirthDate.toISOString().split("T")[0]
      : "-";
  researchManagerContainerBirthDate.innerHTML = tempBirthDateStr;

  researchManagerContainer.appendChild(researchManagerContainerTitle);
  researchManagerContainer.appendChild(researchManagerContainerName);
  researchManagerContainer.appendChild(researchManagerContainerGender);
  researchManagerContainer.appendChild(researchManagerContainerBirthDate);
  wrapperDiv.appendChild(researchManagerContainer);
};

/**
 * Change managing organization's information card
 */
const changeOrganizationInfoContent = ({
  organizationName,
  organizationAbbreviation,
  organizationStreet,
  organizationNumber,
  organizationPostalCode,
  organizationCity,
  organizationCategory,
}) => {
  // create organization div & data
  const organizationContainer = document.createElement("div");
  organizationContainer.className = "organization-card";
  const organizationContainerTitle = document.createElement("h3");
  organizationContainerTitle.innerHTML = "Managing Organization";
  const organizationContainerName = document.createElement("p");
  organizationContainerName.className = "main";
  organizationContainerName.innerHTML = `${organizationName} (${organizationAbbreviation})`;
  const organizationContainerCategory = document.createElement("p");
  organizationContainerCategory.className = "secondary";
  organizationContainerCategory.innerHTML = organizationCategory;
  const organizationContainerAddress = document.createElement("p");
  organizationContainerAddress.innerHTML = `${organizationStreet} ${organizationNumber}, ${organizationPostalCode}, ${organizationCity}`;

  organizationContainer.appendChild(organizationContainerTitle);
  organizationContainer.appendChild(organizationContainerName);
  organizationContainer.appendChild(organizationContainerCategory);
  organizationContainer.appendChild(organizationContainerAddress);
  wrapperDiv.appendChild(organizationContainer);
};

/**
 * Change research fields list
 */
const changeResearchFieldsContent = (projectInfo) => {
  // create research fields div & list of related fields
  const researchFieldsContainer = document.createElement("div");
  researchFieldsContainer.className = "research-fields-list";
  const researchFieldsContainerTitle = document.createElement("h3");
  researchFieldsContainerTitle.innerHTML = "Research Fields";
  researchFieldsContainer.appendChild(researchFieldsContainerTitle);

  for (let row of projectInfo) {
    const { researchFieldName } = row;
    const researchFieldNameValue = document.createElement("p");
    researchFieldNameValue.className = "main";
    researchFieldNameValue.innerHTML = researchFieldName;
    researchFieldsContainer.appendChild(researchFieldNameValue);
  }

  wrapperDiv.appendChild(researchFieldsContainer);
};

/**
 * Change deliverables list
 */
const changeDeliverablesContent = (deliverables) => {
  if (deliverables?.length > 0) {
    // create header
    const deliverablesHeaderRow = document.createElement("div");
    deliverablesHeaderRow.className = "deliverables-row head";
    const deliverablesHeaderRowTitle = document.createElement("h4");
    deliverablesHeaderRowTitle.innerHTML = "Deliverable Title";
    const deliverablesHeaderRowDescription = document.createElement("h4");
    deliverablesHeaderRowDescription.innerHTML = "Deliverable Description";
    const deliverablesHeaderRowDeliveryDate = document.createElement("h4");
    deliverablesHeaderRowDeliveryDate.innerHTML = "Delivery Date";

    deliverablesHeaderRow.appendChild(deliverablesHeaderRowTitle);
    deliverablesHeaderRow.appendChild(deliverablesHeaderRowDescription);
    deliverablesHeaderRow.appendChild(deliverablesHeaderRowDeliveryDate);
    deliverablesWrapperDiv.appendChild(deliverablesHeaderRow);

    for (let deliverable of deliverables) {
      // display each deliverable
      const deliverableRow = document.createElement("div");
      deliverableRow.className = "deliverables-row";
      const deliverableTitle = document.createElement("p");
      deliverableTitle.innerHTML = deliverable.title;
      const deliverableDescription = document.createElement("p");
      deliverableDescription.innerHTML = deliverable.description;
      const deliverableDate = document.createElement("p");
      const tempDeliverableDate = deliverable.deliveryDate
        ? new Date(deliverable.deliveryDate)
        : null;
      deliverableDate.innerHTML =
        tempDeliverableDate && !isNaN(tempDeliverableDate)
          ? tempDeliverableDate.toISOString().split("T")[0]
          : "-";

      deliverableRow.appendChild(deliverableTitle);
      deliverableRow.appendChild(deliverableDescription);
      deliverableRow.appendChild(deliverableDate);
      deliverablesWrapperDiv.appendChild(deliverableRow);
    }
  } else {
    const noDeliverablesFoundMessage = document.createElement("h4");
    noDeliverablesFoundMessage.innerHTML = "This project has no deliverables";
    noDeliverablesFoundMessage.className = "main";
    deliverablesWrapperDiv.appendChild(noDeliverablesFoundMessage);
  }
};

// After successfull request for project's information, update/create the lists
const setProjectInformationData = (
  responseProjectInfo,
  responseDeliverables
) => {
  // clean the lists' contents
  projectInfoWrapperDiv.innerHTML = "";
  projectDetailsWrapperDiv.innerHTML = "";
  wrapperDiv.innerHTML = "";
  deliverablesWrapperDiv.innerHTML = "";

  // error
  if (!responseProjectInfo) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (responseProjectInfo.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No data found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  // create project's information & details
  changeProjectInfoContent(responseProjectInfo[0]);
  changeProjectDetailsContent(responseProjectInfo[0]);
  changeResearchManagerInfoContent(responseProjectInfo[0]);
  changeOrganizationInfoContent(responseProjectInfo[0]);
  changeResearchFieldsContent(responseProjectInfo);
  changeDeliverablesContent(responseDeliverables);
};

/**
 * Asynchronous function: Get selected project's information from API
 */
const getProjectInformation = async () => {
  const id = projectTitleInput?.options[projectTitleInput.selectedIndex]?.value;
  if (!id) return;

  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${baseUrl}/api/projects/information/${id}`;
    const response = await fetch(requestUrl);
    const { projectInformation, projectDeliverables } = await response.json();
    setProjectInformationData(projectInformation, projectDeliverables);
  } catch (e) {
    console.log(e);
    setProjectInformationData();
  }
};

/**
 * Asynchronous function: Get all projects from API
 */
const getProjects = async () => {
  try {
    const response = await fetch(`${baseUrl}/api/projects/titles`);
    const { projects } = await response.json();
    for (let project of projects) {
      const opt = document.createElement("option");
      opt.value = project.id;
      opt.innerHTML = project.title;
      projectTitleInput.appendChild(opt);
    }
    if (urlParams?.has("id")) {
      projectTitleInput.value = urlParams.get("id");
    } else {
      projectTitleInput.value = projects[0].id;
    }
    getProjectInformation();
  } catch (e) {}
};

projectTitleInput.addEventListener("change", getProjectInformation);
getProjects();
