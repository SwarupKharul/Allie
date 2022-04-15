//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "synthetix/contracts/interfaces/IAddressResolver.sol";
import "synthetix/contracts/interfaces/IFeePool.sol";

contract MyReward {
    IAddressResolver public synthetixResolver;

    constructor(IAddressResolver _snxResolver) public {
        synthetixResolver = _snxResolver;
    }

    function synthetixClaim() external {
      IFeePool feePool = synthetixResolver.getAddress("FeePool");
      require(feePool != address(0), "FeePool is missing from Synthetix resolver");

      // Claim as msg.sender = address(MyContractd)
      feePool.claimFees();
    }

    function synthetixClaimOnBehalf(address user) external {
        IFeePool feePool = synthetixResolver.getAddress("FeePool");
        require(feePool != address(0), "FeePool is missing from Synthetix resolver");

        // Note: this will fail if `DelegateApprovals.approveClaimOnBehalf(address(MyContract))` has
        // not yet been invoked by the `user`
        feePool.claimOnBehalf(user);
    }
}