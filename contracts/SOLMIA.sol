// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.26;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20FlashMint} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact security@awesome.com
contract SoloMia is ERC20, Ownable, ERC20Permit, ERC20FlashMint {
    constructor(address initialOwner)
        ERC20("Solo Mia", "SOLMIA")
        Ownable(initialOwner)
        ERC20Permit("Solo Mia")
    {
        _mint(msg.sender, 1000000000 * 10 ** decimals());
    }

    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

}