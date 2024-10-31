// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

struct Point {
    uint128 lat;
    uint128 long;
}

struct Tree {
    uint128 initialPlantedTree;
    uint128 currentPlantedTree;
    uint128 carbonCreditLand;
    Point[] coordinate;
}

contract Wrapper {
    constructor() {}
}
