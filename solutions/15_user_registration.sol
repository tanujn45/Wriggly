pragma solidity ^0.8.4;

contract UserRegistration {
    // Define a struct to hold user information
    struct UserInfo {
        string name;
        string email;
    }

    // Define a mapping to store user information
    mapping(address => UserInfo) private userMapping;

    // Define an event to emit when a new user is registered
    event NewUserRegistered(
        address indexed userAddress,
        string name,
        string email
    );

    // Define the contract owner
    address public owner;

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Define a modifier to restrict certain functions to the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Define a function to register user information
    function registerUser(string memory _name, string memory _email) public {
        userMapping[msg.sender] = UserInfo(_name, _email);
        emit NewUserRegistered(msg.sender, _name, _email);
    }

    // Define a function to retrieve user information
    function getUserInfo()
        public
        view
        returns (string memory name, string memory email)
    {
        UserInfo memory user = userMapping[msg.sender];
        name = user.name;
        email = user.email;
    }

    // Define a function to update user information
    function updateUserInfo(string memory _name, string memory _email) public {
        UserInfo storage user = userMapping[msg.sender];
        user.name = _name;
        user.email = _email;
    }

    // Define a function to delete user information
    function deleteUser() public {
        delete userMapping[msg.sender];
    }
}
