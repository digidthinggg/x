// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Wallet {
  event StartTransfer();

  function getNumber() public pure returns (int) {
    return 3;
  }

  function startTransfer() external {
    emit StartTransfer();
  }

  function WTF() external {
  }
}
