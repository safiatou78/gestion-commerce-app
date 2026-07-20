-- CreateEnum
CREATE TYPE "StatutBoutique" AS ENUM ('EN_ATTENTE', 'ESSAI', 'ACTIVE', 'EXPIREE', 'SUSPENDUE');

-- CreateTable
CREATE TABLE "boutiques" (
    "id" TEXT NOT NULL,
    "nom" TEXT NOT NULL,
    "telephone" TEXT,
    "adresse" TEXT,
    "statut" "StatutBoutique" NOT NULL DEFAULT 'EN_ATTENTE',
    "date_debut_essai" TIMESTAMP(3),
    "date_fin_essai" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "boutiques_pkey" PRIMARY KEY ("id")
);
