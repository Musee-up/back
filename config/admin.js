module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '08ee9974c4dc73bdc5dc360f9fa3f71c'),
  },
});
