// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTPay is  ERC721Enumerable, Ownable {
    struct TokenData {
        string name;
        string addressInfo;
        uint256 number;
        uint256 price;
        address owner; // Add owner field
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
        uint256 price
    );

    function mint(
        address to,
        uint256 tokenId,
        string memory name,
        string memory addressInfo,
        uint256 number,
        uint256 price
    ) public onlyOwner {
        _mint(to, tokenId);
        _setTokenData(tokenId, name, addressInfo, number, price, to); // Set the owner as the seller
        emit NFTMinted(to, tokenId, name, addressInfo, number, price);
    }
    function _setTokenData(
        uint256 tokenId,
        string memory name,
        string memory addressInfo,
        uint256 number,
        uint256 price,
        address owner
    ) internal {
        require(_exists(tokenId), "Token does not exist");
        TokenData storage data = _tokenData[tokenId];
        data.name = name;
        data.addressInfo = addressInfo;
        data.number = number;
        data.price = price;
        data.owner = owner; // Set the owner (seller)
    }

    function listNFT(uint256 tokenId, uint256 price) public {
        require(price > 0, "NFTMarket: price must be greater than 0");
        require(_isApprovedOrOwner(msg.sender, tokenId), "NFTMarket: caller is not owner or approved");
        _tokenData[tokenId].price = price;
        _tokenData[tokenId].owner = msg.sender; // Set the owner as the seller
        emit NFTMinted(msg.sender, tokenId, "", "", 0, price);
    }

    function buyNFT(uint256 tokenId) public payable {
        TokenData memory tokenData = _tokenData[tokenId];
        require(tokenData.price > 0, "NFTMarket: NFT not listed for sale");
        require(msg.value == tokenData.price, "NFTMarket: incorrect price");

        address owner = tokenData.owner;
        address buyer = msg.sender;

        _transfer(owner, buyer, tokenId); // Transfer the NFT to the buyer
        clearListing(tokenId); // Clear the listing
        payable(owner).transfer(tokenData.price); // Send the payment to the owner (who is also the seller)
        emit NFTMinted(buyer, tokenId, "", "", 0, tokenData.price);
    }

    function getTokenData(uint256 tokenId)
        public
        view
        returns (
            string memory name,
            string memory addressInfo,
            uint256 number,
            uint256 price,
            address owner
        )
    {
        require(_exists(tokenId), "Token does not exist");
        TokenData memory data = _tokenData[tokenId];
        return (data.name, data.addressInfo, data.number, data.price, data.owner);
    }

    function clearListing(uint256 tokenId) private {
        _tokenData[tokenId].price = 0;
        _tokenData[tokenId].owner = address(0);
    }
    function getTotalIds() public view returns (uint256) {
        return totalSupply();
    }
    function getTokensOwnedBy(address owner) public view returns (uint256[] memory) {
        uint256 totalTokens = balanceOf(owner);
        uint256[] memory ownedTokenIds = new uint256[](totalTokens);

        for (uint256 i = 0; i < totalTokens; i++) {
            ownedTokenIds[i] = tokenOfOwnerByIndex(owner, i);
        }

        return ownedTokenIds;
    }
    
    function getTokenDataForOwner(address owner) public view returns (TokenData[] memory) {
        uint256[] memory ownedTokenIds = getTokensOwnedBy(owner);
        TokenData[] memory tokenDataList = new TokenData[](ownedTokenIds.length);

        for (uint256 i = 0; i < ownedTokenIds.length; i++) {
            uint256 tokenId = ownedTokenIds[i];
            tokenDataList[i] = _tokenData[tokenId];
        }

        return tokenDataList;
    }
}

