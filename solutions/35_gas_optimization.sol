pragma solidity ^0.8.4;

contract Solution {
    uint public total;
    uint gasUsed;

    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
        uint startGas = gasleft();
        uint256 currTotal;
        for (uint i = 0; i < nums.length; ++i) {
            uint curr = nums[i];
            if (curr % 2 == 0 && curr < 99) {
                currTotal += curr;
            }
        }
        total += currTotal;
        gasUsed = startGas - gasleft();
    }

    function gasOptimized(uint optimizedGas) public view returns (bool) {
        if (gasUsed < optimizedGas) {
            return true;
        } else {
            return false;
        }
    }
}
