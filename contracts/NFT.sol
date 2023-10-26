// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721Enumerable, Ownable {
    struct TokenData {
        string name;
        string addressInfo;
        uint256 number;
        string imageURI; // URI to the image (can be IPFS, HTTP, or any other protocol)
    }

    // Mapping from token ID to additional token data
    mapping(uint256 => TokenData) private _tokenData;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    event NFTMinted(
        address indexed owner,
        uint256 indexed tokenId,
        string name,
        string addressInfo,
        uint256 number,
        string imageURI
    );

    function mint(
        address to,
        uint256 tokenId,
        string memory name,
        string memory addressInfo,
        uint256 number,
        string memory imageURI
    ) public onlyOwner {
        _mint(to, tokenId);
        _setTokenData(tokenId, name, addressInfo, number, imageURI);
        emit NFTMinted(to, tokenId, name, addressInfo, number, imageURI);
    }

    function getTokenData(uint256 tokenId)
        public
        view
        returns (
            string memory name,
            string memory addressInfo,
            uint256 number,
            string memory imageURI
        )
    {
        require(_exists(tokenId), "Token does not exist");
        TokenData memory data = _tokenData[tokenId];
        return (data.name, data.addressInfo, data.number, data.imageURI);
    }

    function _setTokenData(
        uint256 tokenId,
        string memory name,
        string memory addressInfo,
        uint256 number,
        string memory imageURI
    ) internal {
        require(_exists(tokenId), "Token does not exist");
        TokenData storage data = _tokenData[tokenId];
        data.name = name;
        data.addressInfo = addressInfo;
        data.number = number;
        data.imageURI = imageURI;
    }
    function getTotalIds() public view returns (uint256) {
        return totalSupply();
    }
}
