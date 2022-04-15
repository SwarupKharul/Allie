//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "synthetix/contracts/interfaces/IAddressResolver.sol";
import "synthetix/contracts/interfaces/ISynthetix.sol";


contract MyStake {
    IAddressResolver public synthetixResolver;

    constructor(IAddressResolver _snxResolver) public {
        synthetixResolver = _snxResolver;
    }

    function synthetixIssue() external {
      ISynthetix synthetix = synthetixResolver.getAddress("Synthetix");
      require(synthetix != address(0), "Synthetix is missing from Synthetix resolver");

      // Issue for msg.sender = address(MyContract)
      synthetix.issueMaxSynths();
    }

    function synthetixIssueOnBehalf(address user) external {
        ISynthetix synthetix = synthetixResolver.getAddress("Synthetix");
        require(synthetix != address(0), "Synthetix is missing from Synthetix resolver");
        synthetix.issueMaxSynthsOnBehalf(user);
    }
}