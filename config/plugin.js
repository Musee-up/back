'use strict';

const { join } = require('path');

module.exports = () => ({
  graphql: {
    enabled: true,
    config: {
      endpoint: '/graphql',
      shadowCRUD: true,
      playgroundAlways: false,
      depthLimit: 7,
      amountLimit: 100,
      apolloServer: {
        tracing: false,
      },
      generateArtifacts: true,
      artifacts: {
        schema: join(__dirname, '..', 'public/generate/schema.graphql'),
        typegen: join(__dirname, '..', 'types.d.ts'),
      },
    },
  }
});
