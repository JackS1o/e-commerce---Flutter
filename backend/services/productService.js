const { Product } = require("../database/models");

const createProduct = async (body) => {
  const product = await Promise.all([
    body.map(async (product) => {
      const { userId, name, price, image, quantity } = product;
      return await Product.create({ userId, name, price, image, quantity });
    }),
  ]);
  return product;
};

const getUserProducts = async (id) => {
  const products = await Product.findAll({ where: { userId: id } });
  return products;
};

module.exports = {
  createProduct,
  getUserProducts,
};
