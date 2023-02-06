const { User } = require('../database/models');

const createUser = async (email, password) => {
  const user = await User.create({ email, password });
  return user;
}

module.exports = {
  createUser,
}