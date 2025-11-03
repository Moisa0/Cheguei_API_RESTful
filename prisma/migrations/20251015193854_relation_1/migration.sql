/*
  Warnings:

  - You are about to drop the column `telefone` on the `coordenadores` table. All the data in the column will be lost.
  - You are about to drop the column `telefone` on the `esdeps` table. All the data in the column will be lost.
  - You are about to drop the column `telefone` on the `estagiarios` table. All the data in the column will be lost.
  - You are about to drop the column `telefone` on the `gestores` table. All the data in the column will be lost.
  - You are about to drop the column `telefone` on the `masters` table. All the data in the column will be lost.
  - Added the required column `esdepId` to the `coordenadores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `estagiarioId` to the `coordenadores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `masterId` to the `coordenadores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `masterId` to the `esdeps` table without a default value. This is not possible if the table is not empty.
  - Added the required column `coordenadorId` to the `estagiarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `esdepId` to the `estagiarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gestorId` to the `estagiarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `masterId` to the `estagiarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nivelEstag` to the `estagiarios` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `typeEstag` on the `estagiarios` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `coordenadorId` to the `gestores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `esdepId` to the `gestores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `masterId` to the `gestores` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `typeGestor` on the `gestores` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "TypeEstag" AS ENUM ('DIREITO', 'TI', 'ADM', 'MEDIO');

-- CreateEnum
CREATE TYPE "StatusType" AS ENUM ('PENDENTE', 'ACEITO', 'INDEFERIDO');

-- AlterTable
ALTER TABLE "coordenadores" DROP COLUMN "telefone",
ADD COLUMN     "esdepId" TEXT NOT NULL,
ADD COLUMN     "estagiarioId" TEXT NOT NULL,
ADD COLUMN     "masterId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "esdeps" DROP COLUMN "telefone",
ADD COLUMN     "masterId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "estagiarios" DROP COLUMN "telefone",
ADD COLUMN     "coordenadorId" TEXT NOT NULL,
ADD COLUMN     "esdepId" TEXT NOT NULL,
ADD COLUMN     "gestorId" TEXT NOT NULL,
ADD COLUMN     "masterId" TEXT NOT NULL,
ADD COLUMN     "nivelEstag" "NivelType" NOT NULL,
DROP COLUMN "typeEstag",
ADD COLUMN     "typeEstag" "TypeEstag" NOT NULL;

-- AlterTable
ALTER TABLE "gestores" DROP COLUMN "telefone",
ADD COLUMN     "coordenadorId" TEXT NOT NULL,
ADD COLUMN     "esdepId" TEXT NOT NULL,
ADD COLUMN     "masterId" TEXT NOT NULL,
DROP COLUMN "typeGestor",
ADD COLUMN     "typeGestor" "TypeEstag" NOT NULL;

-- AlterTable
ALTER TABLE "masters" DROP COLUMN "telefone";

-- DropEnum
DROP TYPE "GestorType";

-- CreateTable
CREATE TABLE "folhaDePontos" (
    "id" TEXT NOT NULL,
    "mes" INTEGER NOT NULL,
    "ano" INTEGER NOT NULL,
    "horasTrabalhadas" INTEGER NOT NULL,
    "observacao" TEXT,
    "entrada" TIMESTAMP(3),
    "saida" TIMESTAMP(3),
    "estagiarioId" TEXT NOT NULL,
    "arquivoEstagiario" TEXT,
    "arquivoGestor" TEXT,
    "arquivoFinal" TEXT,

    CONSTRAINT "folhaDePontos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "justificativas" (
    "id" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "tipo" TEXT,
    "dataEnvio" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "estagiarioId" TEXT NOT NULL,
    "status" "StatusType" NOT NULL DEFAULT 'PENDENTE',
    "gestorId" TEXT NOT NULL,

    CONSTRAINT "justificativas_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "estagiarios" ADD CONSTRAINT "estagiarios_gestorId_fkey" FOREIGN KEY ("gestorId") REFERENCES "gestores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estagiarios" ADD CONSTRAINT "estagiarios_esdepId_fkey" FOREIGN KEY ("esdepId") REFERENCES "esdeps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estagiarios" ADD CONSTRAINT "estagiarios_coordenadorId_fkey" FOREIGN KEY ("coordenadorId") REFERENCES "coordenadores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estagiarios" ADD CONSTRAINT "estagiarios_masterId_fkey" FOREIGN KEY ("masterId") REFERENCES "masters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gestores" ADD CONSTRAINT "gestores_coordenadorId_fkey" FOREIGN KEY ("coordenadorId") REFERENCES "coordenadores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gestores" ADD CONSTRAINT "gestores_masterId_fkey" FOREIGN KEY ("masterId") REFERENCES "masters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gestores" ADD CONSTRAINT "gestores_esdepId_fkey" FOREIGN KEY ("esdepId") REFERENCES "esdeps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coordenadores" ADD CONSTRAINT "coordenadores_esdepId_fkey" FOREIGN KEY ("esdepId") REFERENCES "esdeps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coordenadores" ADD CONSTRAINT "coordenadores_masterId_fkey" FOREIGN KEY ("masterId") REFERENCES "masters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "esdeps" ADD CONSTRAINT "esdeps_masterId_fkey" FOREIGN KEY ("masterId") REFERENCES "masters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "folhaDePontos" ADD CONSTRAINT "folhaDePontos_estagiarioId_fkey" FOREIGN KEY ("estagiarioId") REFERENCES "estagiarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "justificativas" ADD CONSTRAINT "justificativas_estagiarioId_fkey" FOREIGN KEY ("estagiarioId") REFERENCES "estagiarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "justificativas" ADD CONSTRAINT "justificativas_gestorId_fkey" FOREIGN KEY ("gestorId") REFERENCES "gestores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
