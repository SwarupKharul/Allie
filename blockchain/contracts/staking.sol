//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "synthetix/contracts/interfaces/IAddressResolver.sol";
import "synthetix/contracts/interfaces/ISynthetix.sol";


contract MyStake {
    IAddressResolver public synthetixResolver;

    constructor() public {
        synthetixResolver = IAddressResolver(0x4E3b31eB0E5CB73641EE1E65E7dCEFe520bA3ef2);
    }

    function synthetixIssue() external {
      ISynthetix synthetix = ISynthetix(synthetixResolver.getAddress("Synthetix"));
    //   require(synthetix != address(0), "Synthetix is missing from Synthetix resolver");

      // Issue for msg.sender = address(MyContract)
      synthetix.issueMaxSynths();
    }

    function synthetixIssueOnBehalf(address user) external {
        ISynthetix synthetix = ISynthetix(synthetixResolver.getAddress("Synthetix"));
        // require(synthetix != address(0), "Synthetix is missing from Synthetix resolver");
        synthetix.issueMaxSynthsOnBehalf(user);
    }
}