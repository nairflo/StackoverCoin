pragma solidity >=0.4.25 <0.7.0;


contract StandardToken {
	mapping (address => uint) balances;
    mapping (address => mapping (address => uint256)) allowed;
	uint256 public totalSupply;
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function approve(address _spender, uint256 _value) public returns (bool success)  {
		allowed[msg.sender][_spender] = _value;
        return true;
	}

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
		return allowed[_owner][_spender];
	}

	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		//100 pour prendre 1% de la transaction
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		return true;
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
}