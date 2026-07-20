import prisma from "../config/prisma";

async function testDatabase() {
  try {
    const boutiques = await prisma.boutique.findMany();

    console.log("Connexion PostgreSQL réussie ✅");
    console.log("Boutiques trouvées :", boutiques);

  } catch (error) {
    console.error("Erreur connexion Prisma ❌");
    console.error(error);

  } finally {
    await prisma.$disconnect();
  }
}

testDatabase();