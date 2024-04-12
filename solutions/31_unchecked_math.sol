// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract UncheckedMath {
    function add(uint y) external pure returns (uint) {
        unchecked {
            return (2 ** 256 - 1) + y;
        }
    }

    function sub(uint x, uint y) external pure returns (uint) {
        unchecked {
            return x - y;
        }
    }
}
