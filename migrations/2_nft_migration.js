const nft = artifacts.require("Collectible");

module.exports = function(deployer) {
    deployer.deploy(nft);
};