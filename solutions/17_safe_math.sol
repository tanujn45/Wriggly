pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract SafeMathExample {
    using SafeMath for uint256;

    uint256 public value;

    function add(uint256 x, uint256 y) public {
        require(x + y >= x, "Addition overflow");
        value = x + y;
    }

    function sub(uint256 x, uint256 y) public {
        require(y <= x, "Subtraction overflow");
        value = x - y;
    }

    function mul(uint256 x, uint256 y) public {
        require(y == 0 || (x * y) / y == x, "Multiplication overflow");
        value = x * y;
    }

    function div(uint256 x, uint256 y) public {
        require(y > 0, "Division by zero");
        value = x / y;
    }

    function get() public view returns (uint256) {
        return value;
    }
}
