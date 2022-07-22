'use strict';
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);


module.exports = {
  register({ strapi }) {
    const { toEntityResponse, toEntityResponseCollection } = strapi.plugin("graphql").service("format").returnTypes;
    const extensionService = strapi.plugin("graphql").service("extension");

    extensionService.use(({ nexus }) => ({
      resolversConfig: {
        'Mutation.createBooking': {
          middlewares: [
            async (resolve, ...args) => {
              const user = args[2].state.user
              const query = args[1].data

              const slot = await strapi.query("slot").findOne({
                id: query.slot
              })

              if (slot.maxGroupSize < slot.currentGroupSize + query.groupSize) {
                throw new Error("Slot is full")
              }
              slot.currentGroupSize += query.groupSize

              await strapi.query("slot").update({
                id: slot.id
              }, slot)


              await stripe.charges.create({
                amount: 100,
                currency: 'eur',
                description: `Order ${new Date()} by ${user.id}`,
                source: query.token.token.id,
              });
              return resolve(...args);
            }
          ]
        }
      }
    }))
  }
};
