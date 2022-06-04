const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const wrapperDiv = document.querySelector(".organizations-wrapper");

let organizations = null;

/**
 * Change wrapper div's content
 */
const changeOrganizationsContent = () => {
  // clean the list's contents
  wrapperDiv.innerHTML = "";

  // create organizations' list header
  const organizationsHeaderRow = document.createElement("div");
  organizationsHeaderRow.className = "organizations-row head";
  const organizationsHeaderRowName = document.createElement("h4");
  organizationsHeaderRowName.innerHTML = "Organization";
  const organizationsHeaderRowYears = document.createElement("h4");
  organizationsHeaderRowYears.innerHTML = "Years";
  const organizationsHeaderRowProjectsPerYear = document.createElement("h4");
  organizationsHeaderRowProjectsPerYear.innerHTML = "Projects per Year";

  organizationsHeaderRow.appendChild(organizationsHeaderRowName);
  organizationsHeaderRow.appendChild(organizationsHeaderRowYears);
  organizationsHeaderRow.appendChild(organizationsHeaderRowProjectsPerYear);
  wrapperDiv.appendChild(organizationsHeaderRow);

  // create list of organizations
  for (let organization of organizations) {
    const organizationRow = document.createElement("div");
    organizationRow.className = "organizations-row";
    const organizationName = document.createElement("p");
    organizationName.innerHTML = organization.organizationName;
    const organizationYear = document.createElement("p");
    organizationYear.innerHTML = `${organization.yearFrom}-${organization.yearTo}`;
    const organizationProjectsPerYear = document.createElement("p");
    organizationProjectsPerYear.innerHTML = organization.numberOfProjects;

    organizationRow.appendChild(organizationName);
    organizationRow.appendChild(organizationYear);
    organizationRow.appendChild(organizationProjectsPerYear);
    wrapperDiv.appendChild(organizationRow);
  }
};

// After successfull request, construct the list of organizations
const setOrganizationsData = (responseOrganizations) => {
  organizations = responseOrganizations;

  // error
  if (!organizations) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (organizations.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No organizations found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  // create organizations list
  changeOrganizationsContent();
};

/**
 * Asynchronous function: Get all organizations with same number of projects over 2 years from API
 */
const getOrganizations = async () => {
  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const response = await fetch(
      `${window.location.origin}/api/organizations/same-projects-over-2-years`
    );
    const { organizations } = await response.json();
    setOrganizationsData(organizations);
  } catch (e) {
    setOrganizationsData();
  }
};

getOrganizations();
