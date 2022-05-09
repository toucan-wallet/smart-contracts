// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Wallet {
    function deposit(uint256 _amount) external payable {
        require(msg.value == _amount);
        // nothing else to do
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendEther(address payable _to, uint256 _amount) public payable {
        // returns a boolean value indicating success or failure
        (bool sent, bytes memory data) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }
}

// contract needs to receive
// then contract will send
