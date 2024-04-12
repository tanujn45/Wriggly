pragma solidity ^0.8.0;

contract EtherConverter {
    function etherToWei(uint256 etherAmount) public pure returns (uint256) {
        require(etherAmount > 0, "Ether amount must be greater than zero");
        etherAmount = etherAmount * 1e18;
        return etherAmount;
    }

    function weiToEther(uint256 weiAmount) public pure returns (uint256) {
        require(weiAmount > 0, "Wei amount must be greater than zero");
        weiAmount = weiAmount / 1e18;
        return weiAmount;
    }
}
