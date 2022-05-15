const baseUrl = "http://localhost";

const messagePar = document.querySelector(".message");
const containerDiv = document.querySelector(".container");
const wrapperDiv = document.querySelector(".executives-wrapper");

let executives = null;

/**
 * Change wrapper div's content
 */
const changeExecutivesContent = () => {
  // create executives' list header
  const executivesHeaderRow = document.createElement("div");
  executivesHeaderRow.className = "executives-row head";
  const executivesHeaderRowNumber = document.createElement("h4");
  executivesHeaderRowNumber.innerHTML = "#";
  const executivesHeaderRowExecutiveName = document.createElement("h4");
  executivesHeaderRowExecutiveName.innerHTML = "Executive Name";
  const executivesHeaderRowCompanyName = document.createElement("h4");
  executivesHeaderRowCompanyName.innerHTML = "Company Name";
  const executivesHeaderRowTotalFundingAmount = document.createElement("h4");
  executivesHeaderRowTotalFundingAmount.innerHTML = "Total Funding Amount";

  executivesHeaderRow.appendChild(executivesHeaderRowNumber);
  executivesHeaderRow.appendChild(executivesHeaderRowExecutiveName);
  executivesHeaderRow.appendChild(executivesHeaderRowCompanyName);
  executivesHeaderRow.appendChild(executivesHeaderRowTotalFundingAmount);
  wrapperDiv.appendChild(executivesHeaderRow);

  // create list of executives
  let index = 1;
  for (let executive of executives) {
    const executiveRow = document.createElement("div");
    executiveRow.className = "executives-row";
    const executiveNumber = document.createElement("p");
    executiveNumber.innerHTML = index++;
    const executiveExecutiveName = document.createElement("p");
    executiveExecutiveName.innerHTML = executive.executiveName;
    const executiveCompanyName = document.createElement("p");
    executiveCompanyName.innerHTML = executive.companyName;
    const executiveTotalFundingAmount = document.createElement("p");
    executiveTotalFundingAmount.innerHTML = executive.totalFundingAmount;

    executiveRow.appendChild(executiveNumber);
    executiveRow.appendChild(executiveExecutiveName);
    executiveRow.appendChild(executiveCompanyName);
    executiveRow.appendChild(executiveTotalFundingAmount);
    wrapperDiv.appendChild(executiveRow);
  }
};

// After successfull request for total funding amount per company, construct the list of executives
const setExecutivesData = (responseExecutives) => {
  executives = responseExecutives;

  // clean the list's contents
  wrapperDiv.innerHTML = "";

  // error
  if (!executives) {
    messagePar.className = "message has-error";
    messagePar.textContent = "Something went wrong. Please try again";
    return;
  }

  // success but no data found
  if (executives.length === 0) {
    messagePar.className = "message no-data";
    messagePar.textContent = "No executives found. Please try again";
    return;
  }

  // success and data found
  messagePar.className = "message has-data";
  messagePar.textContent = "";

  // create list
  changeExecutivesContent();
};

/**
 * Asynchronous function: Get top-5 executives that have given the biggest amount of funds on a single Company organization
 */
const getTop5Executives = async () => {
  try {
    messagePar.className = "message no-data";
    messagePar.textContent = "Loading...";
    const requestUrl = `${baseUrl}/api/executives/funding-per-company`;
    const response = await fetch(requestUrl);
    const { executives } = await response.json();
    setExecutivesData(executives);
  } catch (e) {
    console.log(e);
    setExecutivesData();
  }
};

getTop5Executives();
