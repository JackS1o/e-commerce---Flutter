const Service = require('../services/userService');

const createUser = async (req, res) => {
  const { email, password } = req.body;
  const userId = await Service.createUser(email, password);
  return res.status(200).json(userId);
}

module.exports = {
  createUser,
}
