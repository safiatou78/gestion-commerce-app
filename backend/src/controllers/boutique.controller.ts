import { Request, Response } from "express";
import { BoutiqueService } from "../services/boutique.service";

export class BoutiqueController {

  private boutiqueService: BoutiqueService;

  constructor() {
    this.boutiqueService = new BoutiqueService();
  }

  async getAll(req: Request, res: Response) {
    try {

      const boutiques = await this.boutiqueService.getAllBoutiques();

      res.status(200).json(boutiques);

    } catch (error) {

      res.status(500).json({
        message: "Erreur serveur",
        error
      });

    }
  }

}