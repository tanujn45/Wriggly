pragma solidity ^0.8.0;

contract SimpleHash {
    uint256 public value;

    function incrementValue() public {
        value++;
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function addNums(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}
