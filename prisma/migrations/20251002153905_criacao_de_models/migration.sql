-- CreateEnum
CREATE TYPE "NivelType" AS ENUM ('SUPERIOR', 'MEDIO');

-- CreateEnum
CREATE TYPE "GestorType" AS ENUM ('DIREITO', 'TI', 'ADM', 'MEDIO');

-- CreateTable
CREATE TABLE "estagiarios" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "typeEstag" "NivelType" NOT NULL,
    "unidade" TEXT NOT NULL,

    CONSTRAINT "estagiarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gestores" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "typeGestor" "GestorType" NOT NULL,
    "unidade" TEXT NOT NULL,
    "upload" TEXT,

    CONSTRAINT "gestores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "coordenadores" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "typeCoord" "NivelType" NOT NULL,

    CONSTRAINT "coordenadores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "esdeps" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,

    CONSTRAINT "esdeps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "masters" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,

    CONSTRAINT "masters_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "estagiarios_email_key" ON "estagiarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "estagiarios_userName_key" ON "estagiarios"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "estagiarios_cpf_key" ON "estagiarios"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "gestores_email_key" ON "gestores"("email");

-- CreateIndex
CREATE UNIQUE INDEX "gestores_userName_key" ON "gestores"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "gestores_cpf_key" ON "gestores"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "coordenadores_email_key" ON "coordenadores"("email");

-- CreateIndex
CREATE UNIQUE INDEX "coordenadores_userName_key" ON "coordenadores"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "coordenadores_cpf_key" ON "coordenadores"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "esdeps_email_key" ON "esdeps"("email");

-- CreateIndex
CREATE UNIQUE INDEX "esdeps_userName_key" ON "esdeps"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "esdeps_cpf_key" ON "esdeps"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "masters_email_key" ON "masters"("email");

-- CreateIndex
CREATE UNIQUE INDEX "masters_userName_key" ON "masters"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "masters_cpf_key" ON "masters"("cpf");
