pragma solidity ^0.4.11;

contract TrololoERC20 {
	string public name;
	string public symbol;
	uint8 public constant decimals = 18;
	uint public totalSupply;

	mapping (address => uint256) public balances;
	mapping (address => mapping (address => uint256)) allowed;

	event Transfer(address indexed from, address indexed to, uint256 value);
	event Approval(address indexed owner, address indexed spender, uint256 value);

	function TrololoERC20(uint256 _totalSupply, string _name, string _symbol) public {
		totalSupply = _totalSupply;
		balances[msg.sender] = totalSupply;
		name = _name;
		symbol = _symbol;
	}

	function totalSupply() public view returns (uint) {
		return totalSupply;
	}

	function balanceOf(address _owner) public constant returns (uint256 balance) {
		return balances[_owner];
	}
	function transfer(address _to, uint256 _value) public returns (bool) {
		require(_to != address(0));
		require(balances[msg.sender] >= _value);
		require(balances[_to] + _value >= balances[_to]);
		balances[msg.sender] -= _value;
		balances[_to] += _value;
		Transfer(msg.sender, _to, _value);
		return true;
	}
	function approve(address _spender, uint256 _value) public returns (bool){
		allowed[msg.sender][_spender] = _value;
		Approval(msg.sender, _spender, _value);
		return true;
	}

	function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
		require(_to != address(0));
		require(_value <= balances[_from]);
		require(_value <= allowed[_from][msg.sender]);
		balances[_from] -= _value;
		balances[_to] += _value;
		allowed[_from][msg.sender] -= _value;
		Transfer(_from, _to, _value);
		return true;
	}

	function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
		return allowed[_owner][_spender];
	}
}