# 🎰 Title Roulette Contract

> Mint your legendary title on Base chain, generated from your birthday!

## 📋 Overview

This is the NFT smart contract for the "Title Roulette" Farcaster Mini App.
Enter your birthday to generate a unique legendary title, then mint it on Base chain directly from Warpcast.

## 🔗 Deployment

| Item | Value |
|------|-------|
| Network | Base Mainnet |
| Contract Address | `0x558924bac486f7C4588c1d0F824Dd9f43FE0daDb` |
| Basescan | [View Contract](https://basescan.org/address/0x558924bac486f7C4588c1d0F824Dd9f43FE0daDb) |
| Standard | ERC-721 |
| Max Supply | 8,888 |
| Mint Price | Free |

## 🎮 Related Projects

- [Title Roulette App](https://title-roulette-j3xw.vercel.app) - Farcaster Mini App
- [GitHub: title-roulette](https://github.com/kasoutarou666/title-roulette)

## 🏆 How Titles Are Generated

Your birthday (year/month/day) is used as a seed to generate a title from 3 categories:

| Category | Examples |
|----------|---------|
| A: Adjective | Legendary, Cursed, Ancient, Ultimate... |
| B: Role | Samurai, Ninja, Philosopher, Wizard... |
| C: Trait | Wanted, Immortal, Glitched, Ascended... |

People with the same birthday always get the same title!

## 📝 Contract Functions

### mint
```solidity
function mint(
  string memory titleEn,
  string memory titleJa,
  uint16 birthYear,
  uint8 birthMonth,
  uint8 birthDay,
  string memory uri
) external
```
Mints a legendary title NFT with birthday metadata on Base chain.

### getRecord
```solidity
function getRecord(uint256 tokenId) external view returns (TitleRecord memory)
```
Returns the title record for a given token ID.

## 🛠️ Tech Stack

- **Solidity** ^0.8.20
- **Foundry** - Testing & Deployment
- **OpenZeppelin** v5.6.1 - ERC-721 Implementation
- **Base** - L2 Blockchain

## 🚀 Local Development

```bash
git clone https://github.com/kasoutarou666/title-roulette-contract.git
cd title-roulette-contract
forge install
forge build
forge test
```

## 📜 License

MIT
