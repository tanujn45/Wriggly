pragma solidity ^0.8.0;

contract MyContract {
    uint public creationTime;
    uint public expirationTime;

    constructor() {
        creationTime = block.timestamp;
    }

    function onTime() public {
        expirationTime = creationTime + 1 days;
    }

    function expire() public {
        expirationTime = creationTime - 1 days;
    }

    function isExpired() public view returns (bool) {
        return block.timestamp >= expirationTime;
    }
}
