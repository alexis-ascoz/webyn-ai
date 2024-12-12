const express = require("express");
const app = express();
const port = 3000;

app.get("/hello", (req, res) => {
  res.json({ message: "Hello, Webyn!" });
});

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});
