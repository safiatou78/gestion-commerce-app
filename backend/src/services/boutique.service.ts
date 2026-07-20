import { BoutiqueRepository } from "../repositories/boutique.repository";

export class BoutiqueService {

  private boutiqueRepository: BoutiqueRepository;

  constructor() {
    this.boutiqueRepository = new BoutiqueRepository();
  }

  async getAllBoutiques() {
    return this.boutiqueRepository.findAll();
  }

}