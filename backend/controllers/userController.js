const Service = require('../services/userService');

const createUser = async (req, res) => {
  const { email, password } = req.body;
  const user = await Service.createUser(email, password);
  res.status(201).json(user);
}

module.exports = {
  createUser,
}
