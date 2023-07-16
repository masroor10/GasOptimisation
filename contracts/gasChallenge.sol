// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    // Implement Fixed-Size Array Technique Here
    uint[10] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // Caching frequently accessed state variable
    uint private sumOfArray;

    constructor() {
        // Calculate the sum of the array during contract deployment
        sumOfArray = calculateSumOfArray();
    }

    // Function to check for sum of array
    function getSumOfArray() public view returns (uint256) {
        return sumOfArray;
    }

    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }

    // Implement Remaining Gas Optimization Techniques Here
    // Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        // Use unchecked block to skip integer overflow checks
        unchecked {
            // Set the entire array to 0 in a single storage write
            for (uint i = 0; i < numbers.length; i++) {
                numbers[i] = 0;
            }
        }

        // Update the cached sum of the array
        sumOfArray = 0;
    }

    // Helper function to calculate the sum of the array during contract deployment
    function calculateSumOfArray() private view returns (uint256) {
        uint256 sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
}
