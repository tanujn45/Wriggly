pragma solidity ^0.8.0;

contract Solution {
    function ripemdHash(string memory _message) public pure returns (bytes20) {
        return ripemd160(bytes(_message));
    }
}
