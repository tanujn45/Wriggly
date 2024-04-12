pragma solidity ^0.8.0;

contract Concatenate {
    function concat(
        string memory str1,
        string memory str2
    ) public pure returns (string memory) {
        return string(abi.encodePacked(str1, str2));
    }
}
