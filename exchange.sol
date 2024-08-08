//// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface MintableERC20 is IERC20{
        
    function mint(address to, uint256 amount) external;
}

contract Exchange is  Ownable{

    IERC20 public ARST;
    MintableERC20 public MPP;
    uint256 price;
    event BUY(address who, uint256 amount);
    constructor(address _ARST, address _MPP, uint256 _price) Ownable(msg.sender) {
        ARST = IERC20(_ARST);
        MPP = MintableERC20(_MPP);
        price = _price;
    }

    function buy(uint256 _amountARST) external{
        //aprove
        ARST.transferFrom( msg.sender,  address(this),      _amountARST) ;
        uint256 _amountMPP = _amountARST * price;
        MPP.mint(msg.sender, _amountMPP);
        emit BUY(msg.sender, _amountMPP);
    }

    function extracARST() external onlyOwner{
        ARST.transfer(msg.sender,ARST.balanceOf(address(this)));
    }

}