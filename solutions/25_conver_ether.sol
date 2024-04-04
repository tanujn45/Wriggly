pragma solidity ^0.8.0;

contract EtherConverter {
    function etherToWei(uint256 etherAmount) public pure returns (uint256) {
        etherAmount = etherAmount * 1e18;
        return etherAmount;
    }

    function weiToEther(uint256 weiAmount) public pure returns (uint256) {
        weiAmount = weiAmount / 1e18;
        return weiAmount;
    }
}
