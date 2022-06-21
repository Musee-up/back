module.exports = ({ env }) => ({
  connection: {
    client: 'postgres',
    connection: {
      host: env('DATABASE_HOST', 'localhost'),
      port: env.int('DATABASE_PORT', 5432),
      database: env('DATABASE_NAME', 'musee_up'),
      user: env('DATABASE_USERNAME', 'postgres'),
      password: env('DATABASE_PASSWORD', '0000'),
      schema: env('DATABASE_SCHEMA', 'public'), // Not required
      ssl: false
      // ssl: {
      //   rejectUnauthorized: env.bool('DATABASE_SSL_SELF', false),
      // },
    },
    debug: false,
  },
});
