'use strict';

module.exports = {
  register({ strapi }) {
    const { toEntityResponse } = strapi.plugin("graphql").service("format").returnTypes;
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
                return toEntityResponse(userData.guide, { args, resourceUID:"api::guide.guide" }) 
              },
            });
          },
        }),
      ]
    }));
  },

  bootstrap({ strapi }) {
    const io = require('socket.io')(strapi.server.httpServer, {
      cors: {
        origin: 'http://localhost:3000',
      }
    })
    io.use((socket, next) => {
      const username = socket.handshake.auth?.username;
      if (!username) {
        return next(new Error("invalid username"));
      }
      socket.username = username;
      next();
    });
    io.on('connection', function(socket){
      socket.broadcast.emit("user connected", {
        userID: socket.id,
        username: socket.username,
      });
      console.log("a user connected")
      // socket.emit('hello', JSON.stringify({message: 'Hello user'}));
      socket.on('disconnect', () => console.log('a user disconnected'));
      socket.on('test', () => console.log('test received'));
    });

    strapi.io = io
  },
  destroy({ strapi }) {},

};
