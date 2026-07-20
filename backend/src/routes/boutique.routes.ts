import { Router } from "express";
import { BoutiqueController } from "../controllers/boutique.controller";

const router = Router();

const boutiqueController = new BoutiqueController();

router.get("/", (req, res) => {
  boutiqueController.getAll(req, res);
});

export default router;