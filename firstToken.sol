// version
pragma solidity ^0.4.11;
//initiate contract
contract MyToken {
	// mapping with amount of tockens for users
	mapping (address => uint256) public balanceOf;
	// initialize contract function (all tockens)
	function MyToken(uint256 _supply){
		balanceOf[msg.sender] = _supply;
		// create all tockens on owners wallet
	}

	// send tockens function
	function transfer(address _to, uint256 _value) public {
	//gets address to send and amount of tockens
		// check that sender has enough tockens
		require(balanceOf[msg.sender] >= _value);

		// check memory of uints
		require(balanceOf[_to] + _value >= balanceOf[_to]);
		// take tockens from sender
		balanceOf[msg.sender] -= _value;
		// give tockens to addressant
		balanceOf[_to] += _value;
	}
}