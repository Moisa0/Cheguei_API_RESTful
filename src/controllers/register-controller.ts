import z from "zod"
import  {Request, Response} from 'express'
import { registerUseCase } from "../use-cases/register-use-case"

export async function registerController(req: Request, res: Response){

    // const registerBodySchema = z.object({
    //     name: z.string().min(3),
    //     email: z.string().email(),
    //     password: z.string().min(6),
    //     userName: z.string(), 
    //     cpf: z.string().length(11),
    //     nivelEstag: z.string(), 
    //     typeEstag: z.string()
    // })  

    // const {name, email, password, userName, cpf, nivelEstag, typeEstag} = registerBodySchema.parse(req.body)

    // try {
    //     await registerUseCase({name, email, password, userName, cpf, nivelEstag, typeEstag})
    // } catch (error) {
    //   return res.status(409).json() 
    // }

    // return res.status(201).send()
}