// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

struct Order {
    uint id;
    uint fragmentNFTId;
    uint amount;
    uint price;
    uint saleAmount;
    bool isApproved;
}

contract Marketplace {
    uint public orderIds;
    mapping(uint => Order) public orders;

    constructor() {}

    function createOrder(
        uint _fragmentNFTId,
        uint _amount,
        uint _price
    ) public {
        Order memory newOrder;
        newOrder.id = orderIds;
        newOrder.amount = _amount;
        newOrder.fragmentNFTId = _fragmentNFTId;
        newOrder.price = _price;

        orders[orderIds] = newOrder;
        orderIds++;
    }

    function approveOrder(uint _orderId) public {
        orders[_orderId].isApproved = true;
    }

    function buy(uint _orderId, uint _amount) public {
        orders[_orderId].saleAmount += _amount;
        // TODO: make transfer amount
    }
}
