// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TitleNFT is ERC721, ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;
    uint256 public constant MAX_SUPPLY = 8888;

    struct TitleRecord {
        string titleEn;
        string titleJa;
        uint16 birthYear;
        uint8 birthMonth;
        uint8 birthDay;
        uint32 timestamp;
    }

    mapping(uint256 => TitleRecord) public records;

    event TitleMinted(
        address indexed minter,
        uint256 tokenId,
        string titleEn,
        string titleJa
    );

    constructor() ERC721("Title Roulette NFT", "TITLE") Ownable(msg.sender) {}

    function mint(
        string memory titleEn,
        string memory titleJa,
        uint16 birthYear,
        uint8 birthMonth,
        uint8 birthDay,
        string memory uri
    ) external {
        require(_tokenIdCounter < MAX_SUPPLY, "Max supply reached");

        uint256 tokenId = _tokenIdCounter++;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, uri);

        records[tokenId] = TitleRecord({
            titleEn: titleEn,
            titleJa: titleJa,
            birthYear: birthYear,
            birthMonth: birthMonth,
            birthDay: birthDay,
            timestamp: uint32(block.timestamp)
        });

        emit TitleMinted(msg.sender, tokenId, titleEn, titleJa);
    }

    function getRecord(uint256 tokenId) external view returns (TitleRecord memory) {
        return records[tokenId];
    }

    function totalSupply() external view returns (uint256) {
        return _tokenIdCounter;
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
