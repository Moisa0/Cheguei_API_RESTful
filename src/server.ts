import express from 'express';
import router from './routes';


const server = express();
server.use(express.json());



server.use('/', router);

server.listen(3000, () => {
  console.log("🚀 HTTP Server Running!");
});