// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BytecodeGetter {
    function getBytecode() public view returns (bytes memory) {
        bytes memory bytecode;
        assembly {
            let freeMemPtr := mload(0x40)

            mstore(bytecode, codesize())

            extcodecopy(address(), add(bytecode, 0x20), 0, codesize())

            mstore(0x40, add(bytecode, add(0x20, codesize())))
        }
        return bytecode;
    }
}
