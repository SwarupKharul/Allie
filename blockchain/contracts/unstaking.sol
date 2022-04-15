//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "synthetix/contracts/interfaces/IAddressResolver.sol";
import "synthetix/contracts/interfaces/ISynthetix.sol";


contract MyUnstake {
    IAddressResolver public synthetixResolver;

    constructor(IAddressResolver _snxResolver) public {
        synthetixResolver = _snxResolver;
    }

    function synthetixBurn() external {
        ISynthetix synthetix = synthetixResolver.getAddress("Synthetix");
        require(synthetix != address(0), "Synthetix is missing from Synthetix resolver");

        uint debt = synthetix.debtBalanceOf(msg.sender, "sUSD");

        // Burn for msg.sender = address(MyContract)
        synthetix.burnSynths(debt);
    }

    function synthetixBurnOnBehalf(address user) external {
        ISynthetix synthetix = synthetixResolver.getAddress("Synthetix");
        require(synthetix != address(0), "Synthetix is missing from Synthetix resolver");

        uint debt = synthetix.debtBalanceOf(user, "sUSD");

        // Note: this will fail if `DelegateApprovals.approveBurnOnBehalf(address(MyContract))` has
        // not yet been invoked by the `user`
        synthetix.burnSynthsOnBehalf(user, debt);
    }
}