// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SolimanWeb3 is ERC721URIStorage, Ownable {
    uint256 private _tokenId;

    constructor() ERC721("Soliman Web3", "SW3") Ownable(msg.sender) {}

    function mintNFT(string memory jsonUri) public onlyOwner returns (uint256) {
        uint256 newTokenId = _tokenId++;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, jsonUri);
        return newTokenId;
    }
}