const Migrations = artifacts.require("Migrations");
const StackoverCoin = artifacts.require("StackoverCoin");
const Post = artifacts.require("PostFactory");
const User = artifacts.require("UserCrypto");
const Strings = artifacts.require("strings");

module.exports = function(deployer) {
  deployer.deploy(StackoverCoin);
  deployer.deploy(Strings);
  deployer.link(Strings, User);
  deployer.deploy(User);
  deployer.deploy(Post);
};
