const express = require("express");
const app = express();

app.listen(3000, () => {
  console.log("Application started and Listening on port 3000");
});

// server your css as static
app.use(express.static(__dirname));

app.post("/", (req, res) => {
  res.send("Thank you for subscribing");
});
