// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/SolimanWeb3.sol";

contract SolimanWeb3Test is Test {
    SolimanWeb3 nft;
    address user = address(0xBEEF);

    function setUp() public {
        nft = new SolimanWeb3();
    }

    function onERC721Received(address, address, uint256, bytes calldata) external pure returns (bytes4) {
        return this.onERC721Received.selector;
    }

    function testMintByOwner() public {
        uint256 id = nft.mintNFT("ipfs://fake-uri");
        assertEq(nft.ownerOf(id), address(this));
        assertEq(nft.tokenURI(id), "ipfs://fake-uri");
    }

    function testMintRevertsForNonOwner() public {
        vm.prank(user);
        vm.expectRevert();
        nft.mintNFT("ipfs://fake-uri");
    }

    function testTokenIdIncrements() public {
        uint256 id0 = nft.mintNFT("uri0");
        uint256 id1 = nft.mintNFT("uri1");
        assertEq(id0, 0);
        assertEq(id1, 1);
    }
}