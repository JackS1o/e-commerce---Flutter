const { Product } = require('../database/models');

const createProduct = async (userId, name, price, image, quantity) => {
  const product = await Product.create({ userId, name, price, image, quantity });
  return product;
};

module.exports = {
  createProduct,
};
