// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract InsuranceContract {
    address public owner;
    IERC20 public token;

    event PolicyHolderEnrolled(address indexed policyHolder);
    event ClaimSubmitted(uint256 indexed claimId, uint256 amount);
    event ClaimProcessed(uint256 indexed claimId, bool approval);
    event FundsWithdrawn();

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor(address _token) {
        owner = msg.sender;
        token = IERC20(_token);
    }

    function enrollPolicyHolder(address policyHolder) external onlyOwner {
        // Enrollment logic
        emit PolicyHolderEnrolled(policyHolder);
    }

    function submitClaim(uint256 claimId, uint256 amount) external {
        // Claim submission logic
        emit ClaimSubmitted(claimId, amount);
    }

    function processClaim(uint256 claimId, bool approval) external onlyOwner {
        // Claim processing logic
        emit ClaimProcessed(claimId, approval);
    }

    function withdrawFunds() external onlyOwner {
        // Withdraw funds logic
        emit FundsWithdrawn();
    }
}
