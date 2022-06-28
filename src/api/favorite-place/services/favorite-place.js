'use strict';

/**
 * favorite-place service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::favorite-place.favorite-place');
