import express from 'express';
import router from './controllers/routes';

const server = express();
server.use(express.json());

server.use('/', router);

server.listen(3000, () => {
  console.log("🚀 HTTP Server Running!");
});