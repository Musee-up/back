// 'use strict';

// module.exports = {
//   // register({ strapi }) {
//   // },

//   // bootstrap({ strapi }) {
//   //   const io = require('socket.io')(strapi.server.httpServer, {
//   //     cors: {
//   //       origin: 'http://localhost:3000',
//   //     }
//   //   })

//   //   // io.use((socket, next) => {
//   //   //   const username = socket.handshake.auth?.username;
//   //   //   if (!username) {
//   //   //     return next(new Error("invalid username"));
//   //   //   }
//   //   //   socket.username = username;
//   //   //   next();
//   //   // });

//   //   io.on('connection', function(socket){
//   //     console.log("a user connected")

//   //     const roomID = '1'
//   //     socket.join(roomID)
//   //     // socket.broadcast.emit("user connected", {
//   //     //   userID: socket.id,
//   //     //   username: socket.username,
//   //     // });
//   //     socket.on("private message", ({ content, to }) => {
//   //       socket.to(roomID).emit("private message", {
//   //         content,
//   //         from: socket.id,
//   //       });
//   //     });
//   //     socket.on('disconnect', () => console.log('a user disconnected'));
//   //   });

//   //   strapi.io = io
//   // },
//   // destroy({ strapi }) {},

// };
