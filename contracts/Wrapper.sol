// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

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

    constructor() {}

    function setLand(uint _landId, Land calldata _landInfo) public {
        lands[_landId] = _landInfo;
    }

    function getLand(uint _landId) public view returns (Land memory) {
        return lands[_landId];
    }

    function getCarbonCredit(address _user) public view returns (uint) {
        return 0;
    }

    function getTree(address _user, uint _landId) public view returns (uint) {
        return 0;
    }
}
