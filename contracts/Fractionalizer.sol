// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Fractionalizer is
    Initializable,
    ERC1155SupplyUpgradeable,
    OwnableUpgradeable
{
    mapping(uint256 => string) public tokenURI;
    uint256 public tokenId;

    function initialize() public initializer {
        __ERC1155_init("");
        __Ownable_init(msg.sender);
    }

    function mint(
        uint256 amount,
        string memory _tokenURI,
        bytes memory data
    ) public returns (uint256) {
        uint256 _tokenId = tokenId;
        tokenURI[_tokenId] = _tokenURI;
        _mint(msg.sender, _tokenId, amount, data);
        tokenId++;
        return _tokenId;
    }

    function uri(
        uint256 _tokenId
    ) public view override returns (string memory) {
        return tokenURI[_tokenId];
    }
}
