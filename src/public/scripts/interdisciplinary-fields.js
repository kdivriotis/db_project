const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const wrapperDiv = document.querySelector(".research-fields-wrapper");
const limitInput = document.querySelector("#fields-limit");

let interdisciplinaryFields = null;
let limit = 3;
limitInput.value = 3;

/**
 * Change wrapper div's content
 */
const changeInterdisciplinaryFieldsContent = () => {
  // create interdisciplinary fields' list header
  const fieldsHeaderRow = document.createElement("div");
  fieldsHeaderRow.className = "research-fields-row head";
  const fieldsHeaderRowNumber = document.createElement("h4");
  fieldsHeaderRowNumber.innerHTML = "#";
  const fieldsHeaderRowField1Name = document.createElement("h4");
  fieldsHeaderRowField1Name.innerHTML = "Field 1";
  const fieldsHeaderRowField2Name = document.createElement("h4");
  fieldsHeaderRowField2Name.innerHTML = "Field 2";
  const fieldsHeaderRowNumberOfProjects = document.createElement("h4");
  fieldsHeaderRowNumberOfProjects.innerHTML = "Number of Projects";

  fieldsHeaderRow.appendChild(fieldsHeaderRowNumber);
  fieldsHeaderRow.appendChild(fieldsHeaderRowField1Name);
  fieldsHeaderRow.appendChild(fieldsHeaderRowField2Name);
  fieldsHeaderRow.appendChild(fieldsHeaderRowNumberOfProjects);
  wrapperDiv.appendChild(fieldsHeaderRow);

  // create list of interdisciplinary fields
  for (let pair of interdisciplinaryFields) {
    const fieldRow = document.createElement("div");
    fieldRow.className = "research-fields-row";
    const fieldNumber = document.createElement("p");
    fieldNumber.innerHTML = pair.fieldRank;
    const fieldName1 = document.createElement("p");
    fieldName1.innerHTML = pair.field1;
    const fieldName2 = document.createElement("p");
    fieldName2.innerHTML = pair.field2;
    const fieldFrequency = document.createElement("p");
    fieldFrequency.innerHTML = pair.frequency;

    fieldRow.appendChild(fieldNumber);
    fieldRow.appendChild(fieldName1);
    fieldRow.appendChild(fieldName2);
    fieldRow.appendChild(fieldFrequency);
    wrapperDiv.appendChild(fieldRow);
  }
};

// After successfull request for project's researchers, construct the list of researchers
const setFieldsData = (responseInterdisciplinaryFields) => {
  interdisciplinaryFields = responseInterdisciplinaryFields;

  // clean the list's contents
  wrapperDiv.innerHTML = "";

  // error
  if (!interdisciplinaryFields) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (interdisciplinaryFields.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No fields found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  // create list
  changeInterdisciplinaryFieldsContent();
};

/**
 * Asynchronous function: Get top-3 most frequent pairs of interdisciplinary fields from API
 */
const getRelatedProjectsAndResearchers = async () => {
  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${window.location.origin}/api/research-fields/interdisciplinary/${limit}`;
    const response = await fetch(requestUrl);
    const { interdisciplinaryFields } = await response.json();
    setFieldsData(interdisciplinaryFields);
  } catch (e) {
    setFieldsData();
  }
};

limitInput.addEventListener("change", (event) => {
  let value = event.target.value;
  if (value > 100) limitInput.value = 100;
  if (value < 1) limitInput.value = 1;

  limit = limitInput.value;
  limitInput.size = 1;
  getRelatedProjectsAndResearchers();
});

getRelatedProjectsAndResearchers();
