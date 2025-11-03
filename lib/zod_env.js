"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.env = void 0;
require("dotenv/config");
const zod_1 = require("zod");
const envSchema = zod_1.z.object({
    NODE_ENV: zod_1.z.enum(['dev', 'test', 'production']).default('dev'),
    PORT: zod_1.z.coerce.number().default(3333),
    JWT_SECRET: zod_1.z.string()
});
const _env = envSchema.safeParse(process.env);
if (!_env.success) {
    console.error('❌ Invalid environment variables', _env.error.format());
    throw new Error('Invalid environment variables.'); //derruba a aplicação impedindo que outras coisas sejam executadas
}
exports.env = _env.data;
//# sourceMappingURL=zod_env.js.map