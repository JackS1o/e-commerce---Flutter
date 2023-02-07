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

// const getAllProducts = async () => {
//   const products = await Product.findAll();
//   return products;
// };

module.exports = {
  createProduct,
  // getAllProducts,
};
