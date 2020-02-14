pragma solidity >=0.4.25 <0.7.0;

import "./StandardToken.sol";

contract StackoverCoin is StandardToken {


    string public name;
    uint8 public decimals;
    uint public circulatingSupply;
    string public symbol;
    string public version = 'v1.0';


    constructor() public{
        decimals = 10;
        totalSupply = 21000000*10**uint256(decimals);
        circulatingSupply = 0;
        name = "StackoverCoin";
        symbol = "SOC";
        balances[msg.sender] = 10*10**uint256(decimals);
    }
}


