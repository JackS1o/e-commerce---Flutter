const { User } = require('../database/models');

const createUser = async (email, password) => {
  const user = await User.create({ email, password });
  return user.id;
};

const getUserId = async () => {
  const [user] = await User.findAll({limit: 1, order: [['id', 'DESC']]});
  return user.id;
};

module.exports = {
  createUser,
  getUserId,
};