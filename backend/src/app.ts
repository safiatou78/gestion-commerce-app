import express from "express";
import boutiqueRoutes from "./routes/boutique.routes";
const app = express();

app.use(express.json());
app.use("/api/boutiques", boutiqueRoutes);
app.get("/", (req, res) => {
  res.json({
    message: "Bienvenue sur l'API Gestion Commerce 🚀"
  });
});

export default app;