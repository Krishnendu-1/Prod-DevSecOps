import express from "express";
const app = express();
app.use(express.json());
app.get("/", (_request, response) => {
    response.json({ message: "Welcome to the Krishnendu's EKS" });
});
app.get("/health", (_request, response) => {
    response.json({ status: "ok" });
});

app.listen(3000, () => {
    console.log(`http://localhost:3000`);
})