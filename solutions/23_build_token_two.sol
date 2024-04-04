pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract WrigglyToken is ERC20 {
    using SafeMath for uint256;

    mapping(address => uint256) private _balances;

    address public owner;

    constructor() ERC20("My Token", "MTKN") {
        owner = msg.sender;
    }

    function _mint(uint256 amount) public {
        _balances[msg.sender] = _balances[msg.sender].add(amount);
    }

    function _burn(uint256 amount) public {
        _balances[msg.sender] = _balances[msg.sender].sub(amount);
    }

    function getBalance() public view returns (uint256) {
        return _balances[msg.sender];
    }
}
