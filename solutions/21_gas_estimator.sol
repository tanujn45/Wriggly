// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasEstimator {
    function estimateGas(bytes memory bytecode) public view returns (uint256) {
        uint256 startGas = gasleft();
        assembly {
            let len := mload(bytecode)
            let ptr := add(bytecode, 0x20)
            if iszero(staticcall(gas(), 0x0, ptr, len, 0x0, 0x0)) {
                revert(0x0, 0x0)
            }
        }
        uint256 gasUsed = startGas - gasleft() + 10; //10 is safe margin
        return gasUsed;
    }
}
