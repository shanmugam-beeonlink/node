const express = require("express");
const app = express();
const port = process.env.PORT || 3000;
const prisma = require("./prisma/prismaClient");
// GET all employees
app.get("/api/employees", async (req, res) => {
  try {
    const employees = await prisma.employee.findMany();
    res.json(employees);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch employees" });
  }
});

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/api/greet", (req, res) => {
  res.json({ message: "Greetings from the API!" });
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
