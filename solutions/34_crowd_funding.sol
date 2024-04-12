pragma solidity ^0.8.4;

contract Crowdfunding {
    address public owner;
    uint public totalRaised;

    constructor() {
        owner = msg.sender;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function donate() public payable {
        require(msg.value > 0, "Please enter an amount greater than zero.");
        totalRaised += msg.value;
    }

    function getTotalRaised() public view returns (uint) {
        return totalRaised;
    }

    function withdrawFunds() public restricted {
        require(address(this).balance > 0, "There are no funds to withdraw.");
        payable(owner).transfer(address(this).balance);
    }

    modifier restricted() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }
}
