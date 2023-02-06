"use strict";

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable(
      "users",
      {
        id: Sequelize.INTEGER,
        name: Sequelize.STRING,
        email: Sequelize.STRING,
        password: Sequelize.STRING,
      },
      {
        timestamps: false,
      }
    );
  },

  async down(queryInterface, _Sequelize) {
    await queryInterface.dropTable("users");
  },
};
