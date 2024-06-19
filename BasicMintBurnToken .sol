// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    // Public variables
    string public tokenName;
    string public tokenAbbrv;
    uint public totalSupply;

    // Mapping variable
    mapping(address => uint) public balances;

    // Events
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    // Constructor
    constructor() {
        tokenName = "Anish Token";
        tokenAbbrv = "ANT";
        totalSupply = 0;
    }

    // Mint function
    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
        emit Mint(_address, _value); // Emit event
    }

    // Burn function
    function burn(address _address, uint _value) public {
        require(balances[_address] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[_address] -= _value;
        emit Burn(_address, _value); // Emit event
    }
}
