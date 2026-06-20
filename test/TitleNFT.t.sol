// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {TitleNFT} from "../src/TitleNFT.sol";

contract TitleNFTTest is Test {
    TitleNFT public nft;
    address public user = address(0x1234);

    function setUp() public {
        nft = new TitleNFT();
    }

    function test_Mint() public {
        vm.prank(user);
        nft.mint("Legendary Samurai Wanted", unicode"伝説の・侍・指名手配中", 1990, 1, 1, "ipfs://test");
        assertEq(nft.totalSupply(), 1);
        assertEq(nft.ownerOf(0), user);
    }

    function test_MintRecord() public {
        vm.prank(user);
        nft.mint("Ancient Ninja Immortal", unicode"古代の・忍者・不死身", 1995, 6, 15, "ipfs://test");
        TitleNFT.TitleRecord memory record = nft.getRecord(0);
        assertEq(record.titleEn, "Ancient Ninja Immortal");
        assertEq(record.titleJa, unicode"古代の・忍者・不死身");
        assertEq(record.birthYear, 1995);
        assertEq(record.birthMonth, 6);
        assertEq(record.birthDay, 15);
    }

    function test_MultipleMints() public {
        vm.prank(user);
        nft.mint("Title One", unicode"称号一", 1990, 1, 1, "ipfs://1");
        vm.prank(user);
        nft.mint("Title Two", unicode"称号二", 1991, 2, 2, "ipfs://2");
        vm.prank(user);
        nft.mint("Title Three", unicode"称号三", 1992, 3, 3, "ipfs://3");
        assertEq(nft.totalSupply(), 3);
    }

    function test_TokenURI() public {
        vm.prank(user);
        nft.mint("Legendary Samurai Wanted", unicode"伝説の・侍・指名手配中", 1990, 1, 1, "ipfs://test123");
        assertEq(nft.tokenURI(0), "ipfs://test123");
    }
}
