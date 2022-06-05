const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const organizationNameInput = document.querySelector("#organization-name");
const organizationInfoWrapperDiv = document.querySelector(
  ".organization-info-wrapper"
);
const organizationPhoneWrapperDiv = document.querySelector(
  ".organization-phones-wrapper"
);

let organizationName = null;

/**
 * Change organization's information card
 */
const changeOrganizationInfoContent = ({
  name,
  abbreviation,
  street,
  number,
  postalCode,
  city,
  companyName,
  companyOwnFunds,
  researchCenterName,
  researchCenterMinistryBudget,
  researchCenterSelfBudget,
  universityName,
  universityMinistryBudget,
}) => {
  // create organization div & data
  const organizationContainer = document.createElement("div");
  organizationContainer.className = "organization-card";
  const organizationContainerTitle = document.createElement("h3");
  organizationContainerTitle.innerHTML = "Organization Information";
  const organizationContainerName = document.createElement("p");
  organizationContainerName.className = "main";
  organizationContainerName.innerHTML = `${name} (${abbreviation})`;
  const organizationContainerAddress = document.createElement("p");
  organizationContainerAddress.innerHTML = `${street} ${number}, ${postalCode}, ${city}`;

  organizationContainer.appendChild(organizationContainerTitle);
  organizationContainer.appendChild(organizationContainerName);
  organizationContainer.appendChild(organizationContainerAddress);

  const organizationContainerCategory = document.createElement("p");
  organizationContainerCategory.className = "main";
  organizationContainer.appendChild(organizationContainerCategory);

  if (companyName) {
    organizationContainerCategory.innerHTML = "Company";
    const organizationContainerOwnFunds = document.createElement("p");
    organizationContainerOwnFunds.className = "secondary";
    organizationContainerOwnFunds.innerHTML = `Own Funds: ${companyOwnFunds} €`;
    organizationContainer.appendChild(organizationContainerOwnFunds);
  } else if (researchCenterName) {
    organizationContainerCategory.innerHTML = "Research Center";
    const organizationContainerMinistryBudget = document.createElement("p");
    organizationContainerMinistryBudget.className = "secondary";
    organizationContainerMinistryBudget.innerHTML = `Education Ministry Budget: ${researchCenterMinistryBudget} €`;
    organizationContainer.appendChild(organizationContainerMinistryBudget);
    const organizationContainerOwnBudget = document.createElement("p");
    organizationContainerOwnBudget.className = "secondary";
    organizationContainerOwnBudget.innerHTML = `Own Actions Budget: ${researchCenterSelfBudget} €`;
    organizationContainer.appendChild(organizationContainerOwnBudget);
  } else if (universityName) {
    organizationContainerCategory.innerHTML = "University";
    const organizationContainerMinistryBudget = document.createElement("p");
    organizationContainerMinistryBudget.className = "secondary";
    organizationContainerMinistryBudget.innerHTML = `Education Ministry Budget: ${universityMinistryBudget} €`;
    organizationContainer.appendChild(organizationContainerMinistryBudget);
  } else {
    organizationContainerCategory.innerHTML = "Unknown";
  }

  organizationInfoWrapperDiv.appendChild(organizationContainer);
};

/**
 * Change phone numbers list
 */
const changeOrganizationPhoneContent = (phoneNumbers) => {
  if (phoneNumbers?.length > 0) {
    // create header
    const phoneNumberContainer = document.createElement("div");
    phoneNumberContainer.className = "organization-card";
    const phoneNumberContainerTitle = document.createElement("h3");
    phoneNumberContainerTitle.innerHTML =
      phoneNumbers?.length > 1 ? "Phone Numbers" : "Phone Number";
    phoneNumberContainer.appendChild(phoneNumberContainerTitle);

    for (let phoneNumber of phoneNumbers) {
      const organizationContainerPhoneNumber = document.createElement("p");
      organizationContainerPhoneNumber.className = "main";
      organizationContainerPhoneNumber.innerHTML = phoneNumber.phone;
      phoneNumberContainer.appendChild(organizationContainerPhoneNumber);
    }
    organizationPhoneWrapperDiv.appendChild(phoneNumberContainer);
  } else {
    const noPhoneNumbersFoundMessage = document.createElement("h4");
    noPhoneNumbersFoundMessage.innerHTML =
      "This organization has no related phone numbers";
    noPhoneNumbersFoundMessage.className = "main";
    organizationPhoneWrapperDiv.appendChild(noPhoneNumbersFoundMessage);
  }
};

// After successfull request for organization's information, update/create the information
const setOrganizationInformationData = (responseOrganizationInfo) => {
  // clean the lists' contents
  organizationInfoWrapperDiv.innerHTML = "";
  organizationPhoneWrapperDiv.innerHTML = "";

  // error
  if (!responseOrganizationInfo) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (responseOrganizationInfo.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No data found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  // create organization's information & details
  changeOrganizationInfoContent(responseOrganizationInfo[0]);
  changeOrganizationPhoneContent(responseOrganizationInfo);
};

/**
 * Asynchronous function: Get selected organization's information from API
 */
const getOrganizationInformation = async () => {
  const name =
    organizationNameInput?.options[organizationNameInput.selectedIndex]?.value;
  if (!name) return;

  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${window.location.origin}/api/organizations/information/${name}`;
    const response = await fetch(requestUrl);
    const { organizationInformation } = await response.json();
    setOrganizationInformationData(organizationInformation);
  } catch (e) {
    console.log(e);
    setOrganizationInformationData();
  }
};

/**
 * Asynchronous function: Get all organizations from API
 */
const getOrganizations = async () => {
  try {
    const response = await fetch(`${window.location.origin}/api/organizations`);
    const { organizations } = await response.json();
    for (let organization of organizations) {
      const opt = document.createElement("option");
      opt.value = organization.name;
      opt.innerHTML = organization.name;
      organizationNameInput.appendChild(opt);
    }
    organizationNameInput.value = organizations[0]?.name;

    getOrganizationInformation();
  } catch (e) {}
};

organizationNameInput.addEventListener("change", getOrganizationInformation);
getOrganizations();
