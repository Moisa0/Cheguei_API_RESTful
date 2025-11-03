
import { prisma } from '../../lib/prisma'
import { hash } from 'bcryptjs'

interface RegisterUseCaseRequest {
    name: string,
    email: string,
    password: string,
    userName: string,
    cpf: string,
    nivelEstag: "SUPERIOR"|"MEDIO",
    typeEstag: "DIREITO"|"TI"|"ADM"|"MEDIO"
}

export async function registerUseCase({name, email, password, userName, cpf, nivelEstag, typeEstag}: RegisterUseCaseRequest) {

    //     const userWithSameEmail = await prisma.estagiario.findUnique({
    //     where: {
    //         email
    //     }
    // })

    // if(userWithSameEmail){
    //     throw new Error('Email já cadastrado.')
    // }

    // const passwordHash = await hash(password, 6)

    // await prisma.estagiario.create({
    //     data: {
    //         name,
    //         email,
    //         password: passwordHash,
    //         userName, 
    //         cpf, 
    //         nivelEstag, 
    //         typeEstag
    //     }
    // })
}