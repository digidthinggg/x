// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./interfaces/IToken.sol";

contract Wallet {
  address tokenAddr;

  function setTokenAddress(address _tokenAddr) public virtual {
    tokenAddr = _tokenAddr;
  }

  function getTokenAddress() public virtual returns (address) {
    return tokenAddr;
  }

  event Receive(address sender, uint amount, uint balance);
  event MintSmartTokensForTokens();
  event StartTransfer();

  address payable public owner;

  struct Transaction {
    //
  }

  Transaction[] transactions;

  constructor() {
    owner = payable(msg.sender);
  }

  receive() external payable {
    emit Receive(msg.sender, msg.value, address(this).balance);

    address sender = msg.sender;
    uint256 amount = msg.value;
    mintSmartTokensForTokens(sender, amount);
  }

  function mintSmartTokensForTokens(address sender, uint256 amount) private {
    require(tokenAddr != address(0), "uninitialized tokenAddr");

    emit MintSmartTokensForTokens();

    // IToken(tokenAddr).mint();
    IToken(tokenAddr).mintAndSendToSender(sender, amount);
  }

  function startTransfer() external {
    emit StartTransfer();
  }
}
