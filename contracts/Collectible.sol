//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Collectible is Ownable, ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private tokenCounter;
    uint nftPrice;

    constructor(uint price) ERC721("Alien On The Ave", "AOTA"){
        nftPrice = price;
    }

    function createCollectible(string memory _tokenURI) external payable returns(uint) {
        require(msg.value >= nftPrice, "Insufficient funds");
        uint256 newItemId = tokenCounter.current();
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, _tokenURI);
        tokenCounter.increment();
        return newItemId;
    }

    function getCollectiblePrice() external view returns(uint) {
        return nftPrice;
    }

    function setNftPrice(uint _price) external onlyOwner {
        nftPrice = _price;
    }
}