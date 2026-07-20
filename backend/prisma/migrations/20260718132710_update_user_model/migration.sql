/*
  Warnings:

  - The values [ADMIN_PLATEFORME,PROPRIETAIRE] on the enum `RoleUtilisateur` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "RoleUtilisateur_new" AS ENUM ('SUPER_ADMIN', 'ADMIN_BOUTIQUE', 'EMPLOYE');
ALTER TABLE "public"."utilisateurs" ALTER COLUMN "role" DROP DEFAULT;
ALTER TABLE "utilisateurs" ALTER COLUMN "role" TYPE "RoleUtilisateur_new" USING ("role"::text::"RoleUtilisateur_new");
ALTER TYPE "RoleUtilisateur" RENAME TO "RoleUtilisateur_old";
ALTER TYPE "RoleUtilisateur_new" RENAME TO "RoleUtilisateur";
DROP TYPE "public"."RoleUtilisateur_old";
ALTER TABLE "utilisateurs" ALTER COLUMN "role" SET DEFAULT 'EMPLOYE';
COMMIT;

-- AlterTable
ALTER TABLE "utilisateurs" ALTER COLUMN "mot_de_passe" DROP NOT NULL;
