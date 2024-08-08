// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PesosToken is ERC20, Ownable {
    constructor()ERC20("PesoToken", "ARST")Ownable(msg.sender){

    }
    
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
//0xc3d521bb7582E4968Af25F24b91B26372139Ca98