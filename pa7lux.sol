pragma solidity ^0.4.11;
// Написать код, который будет показывать число в блокчейне
contract myHomeContract01 {
	uint public number = 1969;
}
// Написать код, который будет показывать число в блокчейне за определенные деньги
contract myHomeContract02 {
	uint public paidNumber;
	function() payable {
		require (msg.value >= 1 finney);
		paidNumber = 1969;
	}
}
// Написать код, который будет показывать сообщение в блокчейне за определенные деньги и переводить их на счет
contract myHomeContract03 {
	address public owner;
	string public Text;
	function myHomeContract03() public{
		owner = 0x967667f1878854F359cA2cc5BDa78a3cf3f235cB;
	}
	function setMessage(string _text) public payable {
		require (msg.value >= 1 finney);
		Text = _text;
		owner.transfer(msg.value);
	}
}
// Написать код, который будет резервировать сообщение на запись на определенное время за определенные деньги и переводить их на счет
contract myHomeContract04 {
	address public owner;
	string public Text;
	uint public lastTimeForDonate;
	uint timeOut = 120 seconds;
	function myHomeContract03() public{
		owner = 0x967667f1878854F359cA2cc5BDa78a3cf3f235cB;
	}
	function setText(string _message) public payable {
		require (msg.value >= 1000 finney);
		require (lastTimeForDonate + timeOut < now);
		Text = _message;
		owner.transfer(msg.value);
	}
}