const { User } = require('../database/models');

const createUser = async (email, password) => {
  const userExists = await User.findOne({ where: { email } });
  if (userExists) {
    return userExists.id;
  }
  const user = await User.create({ email, password });
  return user.id;
};

module.exports = {
  createUser,
};