pragma solidity ^0.8.4;

abstract contract Solution {
    function func1() public view virtual returns (uint) {
        return 100;
    }

    function func2() public view virtual returns (uint) {
        return 200;
    }
}
