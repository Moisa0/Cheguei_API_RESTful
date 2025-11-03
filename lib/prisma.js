"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.prisma = void 0;
const client_1 = require("@prisma/client");
const zod_env_1 = require("./zod_env");
exports.prisma = new client_1.PrismaClient({
    log: zod_env_1.env.NODE_ENV === 'dev' ? ['query'] : []
});
//# sourceMappingURL=prisma.js.map