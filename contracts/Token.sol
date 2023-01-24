// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "./interfaces/IProxy.sol";

contract Token is ERC20 {
  address proxyAddr;

  function setProxyAddress(address _proxyAddr) public virtual {
    proxyAddr = _proxyAddr;
  }

  function getProxyAddress() public virtual returns (address) {
    return proxyAddr;
  }

  event Mint();
  event MintAndSendToSender(address sender, uint256 amount);

  uint constant _initial_supply = 100 * (10**18);

  constructor() ERC20("Token", "TKN") {
    _mint(msg.sender, _initial_supply);
  }

  function mint() external {
    emit Mint();
  }

  function mintAndSendToSender(address sender, uint256 amount) external {
    _mint(sender, amount);
    emit MintAndSendToSender(sender, amount);
  }
}
