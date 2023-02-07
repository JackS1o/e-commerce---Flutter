const Service = require('../services/productService');

const createProduct = async (req, res) => {
  const { userId, name, price, image, quantity } = req.body;
  const product = await Service.createProduct(userId, name, price, image, quantity);
  res.status(201).json(product);
};

module.exports = {
  createProduct,
};
