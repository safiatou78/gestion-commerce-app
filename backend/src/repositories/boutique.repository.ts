import prisma from "../config/prisma";

export class BoutiqueRepository {

  async findAll() {
    return prisma.boutique.findMany();
  }

}