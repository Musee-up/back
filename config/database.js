// const path = require('path');

// module.exports = ({ env }) => ({
//   connection: {
//     client: 'sqlite',
//     connection: {
//       filename: path.join(__dirname, '..', env('DATABASE_FILENAME', '.tmp/data.db')),
//     },
//     useNullAsDefault: true,
//   },
// });

// // postgres://postgres:0000@localhost:5432/musee_up
// // postgres://{user}:{password}@{hostname}:{port}/{database-name}
const parse = require('pg-connection-string').parse;

console.log(config)
module.exports = ({ env }) => ({
  connection: {
    client: 'postgres',
    connection: {
      host: config.host || 'postgres',
      port: config.port || '5432',
      database: config.database || 'musee_up',
      user: config.user || 'postgres',
      password: config.password || '0000',
      // ssl: true
      ssl: {
        rejectUnauthorized: false
      },
    },
    debug: false,
  },
});
