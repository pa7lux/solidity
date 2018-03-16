// version to compiller
pragma solidity ^0.4.11;

// declare contract 

contract LessSimpleContract {
	// donator public variable
	address public donator;
	// owner of smart contract variable
	address public owner;
	// value variable for emount of buy in uint
	uint public value;
	// lastTimeForDonate — when the last transaction hapened in uint
	uint public lastTimeForDonate;
	// lastTimeForValue - how much it was in uint
	uint public lastTimeForValue;
	// timeOut - pause between transactions 120s uint
	uint timeOut = 120 seconds;

	// initialize smart-contract function
	function LessSimpleContract () {
		// who deployed contract to owner
		owner = msg.sender;
	}
	
	// get ethereum function anonymous but with payable modifier
	function() payable {
		// check that it's enough ethereum comes
		require (msg.value > 1 finney);
		// check time condition
		require (lastTimeForDonate + timeOut < now);
		// inner function to change time 
		setDonator(msg.sender);
	}

	// get ethereum and set value function with _value parameter in uint and payable modifier 
	function buyValue(uint _value ) payable {
		// check that it's enough ethereum comes
		require (msg.value > 1 finney);
		// check time condition
		require (lastTimeForValue + timeOut < now);
		// inner function to change time 
		setValue(_value);
	}
	// Setting new value function internal modificator (not public)
	function setValue(uint _value) internal{
		// updating value variable
		value = _value;
		// setting new time
		lastTimeForValue = now;
	}
	// Setting new donator address function 
	function setDonator(address _donator) internal {
		// updating donator variable
		donator = _donator;
		// setting new time
		lastTimeForDonate = now;
	}
}