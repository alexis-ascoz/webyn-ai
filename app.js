const express = require("express");
const app = express();
const port = 3000;

const logger = (req, res, next) => {
  console.log(`Request: ${req.method} ${req.originalUrl}`);
  next();
};

app.get("/hello", logger, (req, res) => {
  res.json({ message: "Hello, Webyn!" });
});

app.get("/health", logger, (req, res) => {
  res.json({ status: "ok" });
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});
