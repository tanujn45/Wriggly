pragma solidity ^0.8.0;

contract SimpleModifiersThree {
    address public owner;
    uint256 public myNumber;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function setNumber(uint256 _number) external onlyOwner {
        myNumber = _number;
    }

    function getNumber() external view returns (uint256) {
        return myNumber;
    }
}
