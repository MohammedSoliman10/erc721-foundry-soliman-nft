# SolimanWeb3 NFT

A minimal ERC-721 NFT smart contract built with [Foundry](https://book.getfoundry.sh/) and [OpenZeppelin](https://www.openzeppelin.com/contracts), deployed and verified on Ethereum Sepolia testnet.

## Overview

`SolimanWeb3` is an owner-only mintable NFT contract using OpenZeppelin's `ERC721URIStorage` extension for on-chain token metadata URI storage, with `Ownable` access control restricting minting to the contract deployer.

- **Name:** Soliman Web3
- **Symbol:** SW3
- **Network:** Ethereum Sepolia (testnet)
- **Contract Address:** [`0xC7f4550699371eABbc1b5b0aAF00007A0C46BCD5`](https://sepolia.etherscan.io/address/0xc7f4550699371eabbc1b5b0aaf00007a0c46bcd5)
- **Status:** Deployed & verified

## Features

- ERC-721 standard implementation via OpenZeppelin
- `ERC721URIStorage` for per-token metadata URIs
- `Ownable` access control — only the contract owner can mint
- `_safeMint` used to prevent tokens getting locked in contracts that can't handle ERC-721
- Metadata hosted on IPFS via Pinata, following [OpenSea's metadata standards](https://docs.opensea.io/docs/metadata-standards)

## Tech Stack

- [Solidity](https://soliditylang.org/) `^0.8.28`
- [Foundry](https://book.getfoundry.sh/) (Forge, for testing & deployment)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Alchemy](https://www.alchemy.com/) (Sepolia RPC)
- [Etherscan](https://etherscan.io/) (contract verification)
- [Pinata](https://pinata.cloud/) (IPFS metadata & image hosting)

## Project Structure

```
├── src/
│   └── SolimanWeb3.sol       # Main ERC-721 contract
├── test/
│   └── SolimanWeb3.t.sol     # Foundry test suite
├── script/
│   ├── Deploy.s.sol          # Deployment script
│   └── Mint.s.sol            # Minting script
├── foundry.toml              # Foundry config + remappings
└── .env.example              # Environment variable template
```

## Contract Interface

```solidity
function mintNFT(string memory jsonUri) public onlyOwner returns (uint256)
```

Mints a new token to the caller (owner) with the given metadata URI, and returns the new token ID.

## Setup

Clone the repo and install dependencies:

```bash
git clone https://github.com/MohammedSoliman10/erc721-foundry-soliman-nft.git
cd erc721-foundry-soliman-nft
forge install
```

### Environment Variables

Copy `.env.example` to `.env` and fill in your own values:

```dotenv
SEPOLIA_RPC_URL=your_alchemy_or_infura_sepolia_url
PRIVATE_KEY=0xyour_private_key
ETHERSCAN_API_KEY=your_etherscan_api_key
CONTRACT_ADDRESS=deployed_contract_address
TOKEN_URI=ipfs://your_metadata_cid
```

⚠️ Never commit your real `.env` file or expose your private key. Use a dedicated testnet wallet, never one holding real funds.

## Testing

```bash
forge test
```

Runs the full test suite covering minting, access control, and token ID incrementing.

## Deployment

```bash
source .env
forge script script/Deploy.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

This deploys the contract to Sepolia and automatically verifies it on Etherscan.

## Minting

Once deployed, set `CONTRACT_ADDRESS` and `TOKEN_URI` (an `ipfs://` link to your metadata JSON) in `.env`, then run:

```bash
source .env
forge script script/Mint.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast
```

## Metadata Format

Metadata follows the OpenSea standard and is hosted on IPFS via Pinata:

```json
{
  "name": "Soliman Web3 #0",
  "description": "My first Web3 NFT — built with Foundry + OpenZeppelin.",
  "image": "ipfs://<image_cid>",
  "attributes": [
    { "trait_type": "Creator", "value": "Soliman" },
    { "trait_type": "Type", "value": "Learning Project" }
  ]
}
```

## License

MIT

## Author

**Mohammed Soliman**
Fullstack Web3 / Blockchain Developer

- GitHub: [@MohammedSoliman10](https://github.com/MohammedSoliman10)
- LinkedIn: [mohammed-soliman05](https://linkedin.com/in/mohammed-soliman05)
- X: [@MohammedSolly05](https://x.com/MohammedSolly05)