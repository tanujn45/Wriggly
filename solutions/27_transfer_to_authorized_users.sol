pragma solidity ^0.8.0;

contract Token {
    mapping(address => uint256) public balances;
    address[] authorizedUsers;

    constructor() {
        authorizedUsers.push(msg.sender);
    }

    modifier onlyAuthorized() {
        bool isAuthorized = false;
        for (uint256 i = 0; i < authorizedUsers.length; i++) {
            if (authorizedUsers[i] == msg.sender) {
                isAuthorized = true;
                break;
            }
        }
        require(isAuthorized, "Unauthorized access");
        _;
    }

    function transfer(address recipient, uint256 amount) public onlyAuthorized {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }

    function addAuthorizedUser(address user) public onlyAuthorized {
        authorizedUsers.push(user);
    }

    function getAuthorizedUsers() public view returns (address[] memory) {
        return authorizedUsers;
    }
}
