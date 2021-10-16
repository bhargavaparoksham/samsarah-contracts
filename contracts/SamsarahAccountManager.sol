//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SamsarahAccountManager is ERC721URIStorage, Ownable {


	// Account creation price
	uint256 public accountCreationPrice;
	// Total number of accounts created till date
	uint256 public accountsCreated;
	// Mapping address to account status
    mapping(address => bool) public accountStatus;

	constructor(
        uint256 _accountCreationPrice
		) ERC721 ("SAMSARAH","SSH") {
		maxAccounts = _maxAccounts;
        accountCreationPrice = _maxAccounts; 	
	}
	
	// Function using which user create a new account

	function createNewAccount(string memory _profileURI) {
        // Require sufficient Eth is provided to create account
        require(msg.value == accountCreationPrice, "Samsarah: Insufficient ETH provided to create new account");
        //Require each address to create only one account
        require(accountStatus[msg.sender] == 0, "Samsarah: An Account has already been created for this address");
        // Safe mint Account.
        _safeMint(msg.sender, accountsCreated);
        // Set account URI
        _setTokenURI(accountsCreated, _profileURI);
        // Update accountStatus
        accountStatus[msg.sender] = 1;
        // Increment accountsCreated
        accountsCreated = accountsCreated + 1;
      
	}


	// Function using which a user can change their account URI

	function updateAccountURI(uint256 _accountId, string memory _profileURI) {
		// Require msg.sender is account owner
		require(msg.sender = ownerOf(_accountId), "Samsarah: Only an owner of the account can update the account URI");
		// Set account URI
        _setTokenURI(_accountId, _profileURI);
	}


	// Function using which governance can update accountCreationPrice

	function setAccountCreationPrice(uint256 _accountCreationPrice) public onlyOwner {
		// Set Account creation price;
		accountCreationPrice = _accountCreationPrice;
	}

}






