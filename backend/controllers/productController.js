const Service = require('../services/productService');

const createProduct = async (req, res) => {
  const { body } = req;
  const product = await Service.createProduct(body);
  return res.status(200).json(product);
};

const getUserProducts = async (req, res) => {
  const { id } = req.params;
  const products = await Service.getUserProducts(id);
  return res.status(200).json(products);
};

module.exports = {
  createProduct,
  getUserProducts,
};
