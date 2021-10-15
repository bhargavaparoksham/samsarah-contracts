//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";


contract SamsarahAccount is ERC721, Ownable {

	constructor() ERC721 ("","") {
		// ALL NFT tokens are self referential i.e are assigned to self address by default

	}

	address[] public following;
	address[] public followers;
	mapping (address => uint256) public trustScore;

	function editProfileURI() {
		// Function using which user will set a base URI & by default 0 will be where the main profile exists.
		// 1 to n will be where individual sub components of the profile exists 
		// These other sub components will be minted only as per user requirement
		// eg; Interests so that it can be used in other apps or for composobality
		// Each address can be mapped with one NFT profile
		// Profiles will be pseudonymous or real based on user preference which will be  sub component in the main profile
	}




	function follow(address _account, uint256 _trustScore) public {
		// Each profile can follow other profiles & when two profiles follow each other it becomes a connection.
	}

	function updateTrustScore() internal {
		// Each profile can set a public trustScore for other profiles they follow
		// Trust Score 0 => Stranger
		// Trust Score 1 => A person who you have interacted / worked with atleast once.
		// Trust Score 2 => Friend / Family
		// Trust Score 3 => Close Friend / Close Family

	}

	function recognize() {
		// Recognize a skill set or a good thing a person did.
		// Anyone can recognize others, a teacher can recognize a student. A work colleague can recognize his colleagues.
		// If a person who has the same level of recognition in that field or Skill, recognizes other person then that can be considered trusted.
		// Recognition can be given top down by a DAO eg: A University DAO or an independent organisation in that field.
		// Score 0 => Ok
		// Score 1 => Good
		// Score 2 => Great
		// Score 3 => Insanely Great
	}

}