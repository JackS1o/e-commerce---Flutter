const Service = require('../services/productService');

const createProduct = async (req, res) => {
  const { body } = req;
  const product = await Service.createProduct(body);
  return res.status(200).json(product);
};

const getAllProducts = async (_req, res) => {
  const products = await Service.getAllProducts();
  return res.status(200).json(products);
}

module.exports = {
  createProduct,
  getAllProducts,
};
