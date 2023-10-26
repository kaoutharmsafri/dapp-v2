# React TypeScript DApp with NFTPay Smart Contract
## Project Overview

This project is a React TypeScript decentralized application (DApp) that interacts with the NFTPay smart contract. NFTPay is an ERC721-compatible NFT (Non-Fungible Token) marketplace, allowing users to mint NFTs, list them for sale, and purchase NFTs from other users.

The smart contract (NFTPay.sol) is implemented using Solidity and inherits from the OpenZeppelin ERC721 and Ownable contracts. It provides functionalities for minting, listing, and buying NFTs, as well as retrieving token data and ownership details.

## Features
  - Mint NFTs: Owners of the smart contract can mint NFTs with specific attributes, such as name, address info, number, and price.
  - List NFTs for Sale: NFT owners can list their NFTs for sale, specifying a sale price.
  - Buy NFTs: Users can purchase listed NFTs by paying the specified price in Ether.
  - Token Data Retrieval: You can retrieve detailed information about NFTs, including name, address info, number, price, and owner.
  - Ownership Information: You can view the NFTs owned by a specific address.

## Project Structure
The project consists of the following components:

  - Smart Contract: The NFTPay.sol Solidity smart contract, which defines the NFTPay marketplace and token data storage.
  - React TypeScript DApp: The user interface for interacting with the smart contract. This DApp allows users to mint, list, and buy NFTs, as well as retrieve token data and ownership information.
