//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./SamsarahAccountManager";


contract SamsarahConnectionManager is Ownable {

	address[] public following;
	address[] public followers;
	mapping (address => uint) public isFollowing;
	mapping (address => uint) public isFollower;
	mapping (address => uint256) public trustScore;

	constructor() {}

	
	function follow(address _account, uint256 _trustScore) public {
		// Each profile can follow other profiles & when two profiles follow each other it becomes a connection.

	}

	function updateTrustScore() public {
		// Each profile can set a public trustScore for other profiles they follow
		// Trust Score 0 => Stranger
		// Trust Score 1 => A person who you have interacted / worked with atleast once.
		// Trust Score 2 => Friend / Family
		// Trust Score 3 => Close Friend / Close Family

	}

}
