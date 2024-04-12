// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Immutable {
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }

    function getVar() public view returns (address, uint) {
        return (MY_ADDRESS, MY_UINT);
    }
}
