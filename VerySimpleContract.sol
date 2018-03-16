// solidity version for compiller
pragma solidity ^0.4.11;

// declare contract 

contract myFirstContract {

	// declare variable donator to store adress property
	address public donator;

	// function to get ethereum 
	function() payable {
		// put the donator address to variable
		donator = msg.sender;
	}	
}

