const NFTPay = artifacts.require('NFTPay');

module.exports = function (deployer) {
    const name = "NFTPay"; // Replace with the desired name
    const symbol = "NP"; // Replace with the desired symbol

    deployer.deploy(NFTPay, name, symbol);
};