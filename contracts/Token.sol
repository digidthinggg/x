// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "./interfaces/IProxy.sol";

contract Token is ERC20 {
  event SimulateTransfer();
  event Mint();

  uint constant _initial_supply = 100 * (10**18);

  constructor() ERC20("Token", "TKN") {
    _mint(msg.sender, _initial_supply);
  }

  function getNumber() public virtual returns (int) {
    return 1;
  }

  address proxyAddr;

  function setProxyAddress(address _proxyAddr) public virtual {
    proxyAddr = _proxyAddr;
  }

  function getProxyAddress() public virtual returns (address) {
    return proxyAddr;
  }

  function simulateTransfer() public virtual {
    IProxy(proxyAddr).startTransfer();
    emit SimulateTransfer();
  }

  function mint() external {
    emit Mint();
  }
}
