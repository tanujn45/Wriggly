pragma solidity ^0.8.0;

contract StringManipulation {
    string public message;

    function setMessage(string memory _newMessage) public {
        require(bytes(_newMessage).length > 0, "Message cannot be empty");
        message = _newMessage;
    }

    function reverseMessage() public view returns (string memory) {
        bytes memory messageBytes = bytes(message);
        uint messageLength = messageBytes.length;
        bytes memory reversedMessage = new bytes(messageLength);

        for (uint i = 0; i < messageLength; i++) {
            reversedMessage[i] = messageBytes[messageLength - 1 - i];
        }

        return string(reversedMessage);
    }
}
