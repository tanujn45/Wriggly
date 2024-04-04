pragma solidity ^0.8.0;

contract KeyPair {
    bytes32 private privateKey;
    bytes32 private publicKey;

    function generateKeyPair() public returns (bytes32, bytes32) {
        privateKey = generatePrivateKey();
        publicKey = computePublicKey(privateKey);

        return (publicKey, privateKey);
    }

    function generatePrivateKey() private returns (bytes32) {
        bytes32 newPrivateKey = keccak256(
            abi.encodePacked(block.timestamp, block.difficulty)
        );
        return newPrivateKey;
    }

    function computePublicKey(
        bytes32 _privateKey
    ) private pure returns (bytes32) {
        return keccak256(abi.encodePacked(_privateKey));
    }
}
