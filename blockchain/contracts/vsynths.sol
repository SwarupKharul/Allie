//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "openzeppelin-solidity-2.3.0/contracts/token/ERC20/IERC20.sol";

import "synthetix/contracts/interfaces/IAddressResolver.sol";
import "synthetix/contracts/interfaces/ISynthetix.sol";

contract MySynth {

  IAddressResolver public synthetixResolver;

  constructor(IAddressResolver _snxResolver) public {
      synthetixResolver = _snxResolver;
  }

  function synthetixExchangeVirtual() external {
      ISynthetix synthetix = synthetixResolver.getAddress("Synthetix");

      require(synthetix != address(0), "Synthetix is missing from Synthetix resolver");

      // exchange 100 sUSD for sBTC using virtual synths
      (uint amountReceived, IVirtualSynth vSynth) = synthetix.exchangeWithVirtual("sUSD", 100e18, "sBTC", bytes32(0));

      // This contract now has 100% of the vSynth supply.
      IERC20 vSynthAsERC20 = IERC20(address(vSynth));

      // And send all to the address that invoked this function
      vSynthAsERC20.transfer(msg.sender, amountReceived);
  }

}