const express = require("express");
const path = require("path");
const dotenv = require("dotenv");
const cors = require("cors");

dotenv.config();

const app = express();
const port = process.env.PORT ? parseInt(process.env.PORT) : 9000;

app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(cors());

/* Public Routes */

/* Serve HTML files */
app.use(express.static(path.join(__dirname, "public")));
app.use("/styles", express.static(path.join(__dirname, "public", "styles")));
app.use("/scripts", express.static(path.join(__dirname, "public", "scripts")));

app.get("/", function (req, res) {
  res.sendFile(path.join(__dirname, "public", "html", "index.html"));
});

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
