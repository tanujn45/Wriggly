pragma solidity ^0.8.0;

contract Token {
    mapping(address => uint256) public balances;
    address[] authorizedUsers;

    constructor() {
        addAuthorizedUser(msg.sender);
    }

    modifier onlyAuthorized() {
        bool isAuthorized = false;
        // TODO
        require(isAuthorized, "Unauthorized access");
        _;
    }

    function transfer(address recipient, uint256 amount) public onlyAuthorized {
        // TODO
    }

    function addAuthorizedUser(address user) public onlyAuthorized {
        // TODO
    }

    function getAuthorizedUsers() public view returns (address[] memory) {
        // TODO
    }
}
