'use strict';

module.exports = {
  register({ strapi }) {
    const { toEntityResponse, toEntityResponseCollection } = strapi.plugin("graphql").service("format").returnTypes;
    const extensionService = strapi.plugin('graphql').service('extension');
    extensionService.use(({ nexus }) => ({
      types: [
        nexus.extendType({
          type: 'UsersPermissionsMe',
          definition(t) {
            t.field("guide", {
              type: "GuideEntityResponse",
              resolve: async (root, args) => {
                const userData = await strapi.db
                  .query("plugin::users-permissions.user")
                  .findOne({
                    select: [],
                    where: { id: root.id },
                    populate: { guide: true },
                  });
                return toEntityResponse(userData.guide, {
                  args,
                  resourceUID:"api::guide.guide"
                }) 
              },
            })
            t.field("rooms", {
              type: "GuideEntityResponse",
              resolve: async (root, args) => {
                const userData = await strapi.db
                  .query("plugin::users-permissions.user")
                  .findOne({
                    select: [],
                    where: { id: root.id },
                    populate: { guide: true },
                  });
                return toEntityResponse(userData.guide, {
                  args,
                  resourceUID:"api::room.room"
                }) 
              },
            })


            t.string("socketID")
            t.field("friends", {
              type: "UsersPermissionsUserEntityResponseCollection",
              resolve: async (root, args) => {
                const userData = await strapi.db
                  .query("plugin::users-permissions.user")
                  .findOne({
                    select: [],
                    where: { id: root.id },
                    populate: { friends: true },
                  });
                return toEntityResponseCollection(userData.friends, {
                  args,
                  resourceUID: "plugin::users-permissions.user"
                }) 
              },
            })
          }
        })
      ]
    }));
  },

  bootstrap({ strapi }) {
    const io = require('socket.io')(strapi.server.httpServer, {
      cors: {
        origin: 'http://localhost:3000',
      }
    })

    // io.use((socket, next) => {
    //   const username = socket.handshake.auth?.username;
    //   if (!username) {
    //     return next(new Error("invalid username"));
    //   }
    //   socket.username = username;
    //   next();
    // });

    io.on('connection', function(socket){
      console.log("a user connected")

      const roomID = '1'
      socket.join(roomID)
      // socket.broadcast.emit("user connected", {
      //   userID: socket.id,
      //   username: socket.username,
      // });
      socket.on("private message", ({ content, to }) => {
        socket.to(roomID).emit("private message", {
          content,
          from: socket.id,
        });
      });
      socket.on('disconnect', () => console.log('a user disconnected'));
    });

    strapi.io = io
  },
  destroy({ strapi }) {},

};
