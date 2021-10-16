//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./SamsarahAccountManager";


contract SamsarahConnectionManager {


    // followee address => follower address => isFollower
	mapping (address => mapping(address => bool)) public isFollower;
	mapping (address => mapping(address => uint)) public trustScore;
    mapping (address => uint256) public follwerCount;
    mapping (address => uint256) public followingCount;    
    // followers: Has an array of all follwers. If a user unfollows even then the follwer address remains in the array. 
    mapping (address => address[]) public followers;
    mapping (address => address[]) public following;
    // mapping (address => uint256[]) public followerStatus;

	constructor() {}

	
	function follow(address _account, uint256 _trustScore) public {
		// Each profile can follow other profiles & when two profiles follow each other it becomes a connection.
        // Require the address to have an account to follow others
        require(accountStatus[msg.sender] == 1, "Samsarah: Please create an account first to follow others");
        require(_trustScore < 5, "Samsarah: Trust score can not be higher than 4");
        require(isFollower[_account][msg.sender] == 0, "Samsarah: Account is already being followed")
        isFollowing[_account][msg.sender] = 1;
        trustScore[_accountunt][msg.sender] = _trustScore;
        followingCount[msg.sender] = followingCount[msg.sender] + 1;
        follwerCount[_account] = follwerCount[_account] + 1;
        following[msg.sender].push(_account);
        followers[_account].push(msg.sender);

	}

	function updateTrustScore(address _account, uint256 _trustScore) public {
		// Each profile can set a public trustScore for other profiles they follow
        require(isFollower[_account][msg.sender] == 1, "Samsarah: Account needs to be followed first to update the trust score");
        require(_trustScore < 5, "Samsarah: Trust score can not be higher than 4");
        trustScore[_accountunt][msg.sender] = _trustScore;        

	}

    function unFollow(address _account) public {
        require(isFollower[_account][msg.sender] == 1, "Samsarah: Account is not followed");
        isFollowing[_account][msg.sender] = 0;
        trustScore[_accountunt][msg.sender] = 0;
        followingCount[msg.sender] = followingCount[msg.sender] - 1;
        follwerCount[_account] = follwerCount[_account] - 1;
    }

}
