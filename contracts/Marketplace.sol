// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

struct Order {
    uint id;
    uint fragmentNFTId;
    uint amount;
    uint price;
    uint saleAmount;
    bool isApproved;
    address owner;
}

contract Marketplace is Initializable {
    uint public orderIds;
    mapping(uint => Order) public orders;
    ERC1155 public fractionalSc;

    function initialize(ERC1155Supply _fractionalSc) public initializer {
        fractionalSc = _fractionalSc;
    }

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
        newOrder.owner = msg.sender;

        orders[orderIds] = newOrder;
        orderIds++;

        fractionalSc.safeTransferFrom(
            msg.sender,
            address(this),
            _fragmentNFTId,
            _amount,
            ""
        );
    }

    function approveOrder(uint _orderId) public {
        orders[_orderId].isApproved = true;
    }

    function buy(uint _orderId, uint _amount) public {
        orders[_orderId].saleAmount += _amount;
        fractionalSc.safeTransferFrom(
            orders[_orderId].owner,
            msg.sender,
            orders[_orderId].fragmentNFTId,
            _amount,
            ""
        );
    }
}
