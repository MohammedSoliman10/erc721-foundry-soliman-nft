// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "../src/SolimanWeb3.sol";

contract MintScript is Script {
    function run() external {
        address contractAddress = vm.envAddress("CONTRACT_ADDRESS");
        string memory jsonUri = vm.envString("TOKEN_URI");

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        SolimanWeb3 nft = SolimanWeb3(contractAddress);
        uint256 tokenId = nft.mintNFT(jsonUri);

        vm.stopBroadcast();

        console.log("Minted token ID:", tokenId);
    }
}