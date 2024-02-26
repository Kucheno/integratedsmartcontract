// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Claims {
    address public owner;
    IERC20 public token;

    event ClaimEvaluated(uint256 indexed claimId, bool approval);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor(address _token) {
        owner = msg.sender;
        token = IERC20(_token);
    }

    function evaluateClaim(uint256 claimId, bool approval) external onlyOwner {
        // Claim evaluation logic
        emit ClaimEvaluated(claimId, approval);
    }
}
