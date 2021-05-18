// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Coin is ERC20{
     // The keyword "public" makes variables
    // accesible from other contracts
    address public minter;
    mapping(address => uint256) public balances;
    // Events allowclients to react to specific contract changes you desire

    event Sent(address from, address to, uint256 amount);
    // Constructor code is only run when the contract is created
    constructor() public ERC20("COINER","CNR"){
        minter = msg.sender;
    }
    // Sends an amount of newly created coins to an address
    // Can only be called by a contract creator
    function mint(address receiver, uint256 amount) public {
        // require(msg.sender == minter, "Sender must be a minter" );
        // require(amount < 1e60, "Amount must be less");
        // balances[receiver] += amount;
        _mint(receiver, amount);
    }

    function send(address receiver, uint256 amount) public {
        // require(amount <= balances[msg.sender],"Insufficient Balance");
        // balances[msg.sender] -= amount;
        // balances[receiver] += amount;
        // emit Sent(msg.sender, receiver, amount);
        _transfer(msg.sender, receiver, amount);
        emit Sent(msg.sender, receiver, amount);
    }
}