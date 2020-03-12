pragma solidity >=0.4.25 <0.7.0;

import "./StandardToken.sol";

contract StackoverCoin is StandardToken {


    string public name;
    uint8 public decimals;
    uint public circulatingSupply;
    string public symbol;
    string public version = 'v1.0';


    constructor() public{
        balances[msg.sender] = 0;
        totalSupply = 21000000;
        circulatingSupply = 0;
        name = "StackoverCoin";
        decimals = 10;
        symbol = "SOC";
    }

    function addCirculatingSupply() public {
        circulatingSupply++;
    }
    function minedCoin(address author, address[] memory addr) public {
        balances[author] += 10 ** decimals;
	}
}


