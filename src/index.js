'use strict';
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

const getBookingSize = (booking) => Object.values(booking.quantityPerAge)?.map(quantity => quantity.quantity).reduce((a, b) => a + b, 0);

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
              const booking = args[1].data

              const slotQuery = strapi.db.query("api::slot.slot")
              const slot = await slotQuery.findOne({
                id: booking.slot
              })
              console.log('booking', booking)
              console.log('slot', slot)

              const bookingSize = getBookingSize(booking)
              if (slot.groupSize.max < slot.groupSize.current + bookingSize) {
                throw new Error("Slot is full")
              }

              slot.groupSize.current += bookingSize

              await slotQuery.update({
                where: {id: slot.id},
                data: {...slot}
              })

              await stripe.charges.create({
                amount: booking.amount,
                currency: 'eur',
                description: `Order ${new Date()} by ${user.id}`,
                source: booking.token.token.id,
              });
              return resolve(...args);
            }
          ]
        }
      }
    }))
  }
};
