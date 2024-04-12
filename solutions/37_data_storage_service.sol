// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStorage {
    mapping(address => string[]) public userData;

    function storeData(string memory data) public payable {
        require(msg.value > 0 ether, "Data storage fee must be greater than 0");
        userData[msg.sender].push(data);
    }

    function getData(uint256 index) public view returns (string memory) {
        require(index < userData[msg.sender].length, "Index out of bounds");
        return userData[msg.sender][index];
    }

    function getDataCount() public view returns (uint256) {
        return userData[msg.sender].length;
    }
}
