const express = require("express");
const path = require("path");
const dotenv = require("dotenv");
const cors = require("cors");

const programs = require("./routes/programs");
const projects = require("./routes/projects");
const executives = require("./routes/executives");
const researchFields = require("./routes/research-fields");
const researhcers = require("./routes/researchers");
const staticPages = require("./routes/static-pages");

dotenv.config();

const app = express();
const port = process.env.PORT ? parseInt(process.env.PORT) : 9000;

app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(cors());

/* Public Routes */
app.use("/api/programs", programs);
app.use("/api/projects", projects);
app.use("/api/executives", executives);
app.use("/api/research-fields", researchFields);
app.use("/api/researchers", researhcers);

/* Serve static files (styles, images, etc.) */
app.use(express.static(path.join(__dirname, "public")));
app.use("/styles", express.static(path.join(__dirname, "public", "styles")));
app.use("/scripts", express.static(path.join(__dirname, "public", "scripts")));
app.use("/images", express.static(path.join(__dirname, "public", "images")));
app.use("/icons", express.static(path.join(__dirname, "public", "icons")));

app.use("/", staticPages);

/* Error handling */
app.use((req, res, next) => {
  const error = new Error("not found");
  return res.status(404).json({
    message: error.message,
  });
});

app.listen(port, () =>
  console.log(`[server]: Server is running at http://localhost:${port}`)
);
