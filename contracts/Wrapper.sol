// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

struct Point {
    uint128 lat;
    uint128 long;
}

struct Land {
    uint128 initialPlantedTree;
    uint128 currentPlantedTree;
    uint128 carbonCreditLand;
    Point[] coordinate;
}

contract Wrapper {
    mapping(uint => Land) lands;
    ERC1155Supply public fractionalSc;
    ERC721 public nftSC;

    constructor() {}

    function setLand(uint _landId, Land calldata _landInfo) public {
        lands[_landId] = _landInfo;
    }

    function getLand(uint _landId) public view returns (Land memory) {
        return lands[_landId];
    }

    function getCarbonCredit(
        address _user,
        uint _landId
    ) public view returns (uint) {
        uint totalSupply = fractionalSc.totalSupply(_landId);
        uint currentFracAmount = fractionalSc.balanceOf(_user, _landId);
        Land memory landInfo = lands[_landId];
        uint tree = (landInfo.currentPlantedTree * currentFracAmount) /
            totalSupply;
        return tree;
    }

    function getTree(address _user, uint _landId) public view returns (uint) {
        uint totalSupply = fractionalSc.totalSupply(_landId);
        uint currentFracAmount = fractionalSc.balanceOf(_user, _landId);
        Land memory landInfo = lands[_landId];
        uint carbon = (landInfo.carbonCreditLand * currentFracAmount) /
            totalSupply;
        return carbon;
    }
}
