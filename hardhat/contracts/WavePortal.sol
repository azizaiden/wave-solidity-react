pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
	uint256 totalWaves;


	event NewWave(address indexed from, uint256 timestamp, string message);
	
	struct Wave {
		address waver;
		string message;
		uint256 timestamp;
	}
	
	Wave[] waves;
	
	
	constructor() {
		console.log("Yo, I am the smart contract");
	}

	function getSha256(string str) public view returns (bytes32) {
		return keccak256(abi.encodePacked(str));
	}

	function wave(string memory _message) public {
		totalWaves += 1; 
		console.log("%s has waved %s!", msg.sender, _message);

		waves.push(Wave(msg.sender, getSha256(_message), block.timestamp));
	
		emit NewWave(msg.sender, block.timestamp, getSha256(_message));
	}

	function getAllWaves() public view returns (Wave[] memory) {
		return waves;
	}
	
	function getTotalWaves() public view returns (uint256){
		console.log("We have %d total waves!", totalWaves);
		return totalWaves;
	}
}
