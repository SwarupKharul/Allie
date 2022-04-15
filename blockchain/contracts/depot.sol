//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "synthetix/contracts/interfaces/IAddressResolver.sol";
import "synthetix/contracts/interfaces/IDepot.sol";

contract MyDepot {
  IAddressResolver public synthetixResolver;

  constructor(IAddressResolver _snxResolver) public {
      synthetixResolver = _snxResolver;
  }

  function synthetixExchangeETHForSynths() external {
    IDepot depot = synthetixResolver.getAddress("Depot");
    require(depot != address(0), "Depot is missing from Synthetix resolver");

    uint etherAmount = 1e15; // 0.001 ETH

    // Either
    depot.exchangeEtherForSynths.value(etherAmount)();

    // or simply
    depot.transfer(etherAmount);
  }

}