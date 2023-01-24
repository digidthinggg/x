// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

interface IToken {
  function mint() external;
  function mintAndSendToSender(address sender, uint256 amount) external;
}
