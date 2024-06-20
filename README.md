MyToken Smart Contract

Overvie

The MyToken smart contract is a simple implementation of an ERC20-like token on the Ethereum blockchain. It allows the creation, management, and burning of tokens. This contract includes essential functions such as minting new tokens to a specified address and burning tokens from a specified address. Additionally, it keeps track of token balances and the total supply of the tokens.

Contract Details

Token Name: Anish Token
Token Abbreviation: ANT
Total Supply: Variable, initially set to 0

Key Features

Public Variables
string public tokenName: The name of the token, "Anish Token".
string public tokenAbbrv: The abbreviation of the token, "ANT".
uint public totalSupply: The total supply of the tokens, initially set to 0.
Mapping Variable

mapping(address => uint) public balances: A mapping that tracks the token balance of each address.

Events
event Mint(address indexed to, uint256 value): This event is emitted when tokens are minted.
event Burn(address indexed from, uint256 value): This event is emitted when tokens are burned.

Constructor
The constructor initializes the token name, abbreviation, and sets the initial total supply to 0.


constructor() {
    tokenName = "Anish Token";
    tokenAbbrv = "ANT";
    totalSupply = 0;
}

Mint Function
The mint function allows the creation of new tokens. It increases the total supply and the balance of the specified address. An event Mint is emitted upon successful minting.



function mint(address _address, uint _value) public {
    totalSupply += _value;
    balances[_address] += _value;
    emit Mint(_address, _value); // Emit event
}

Burn Function
The burn function allows the destruction of tokens from a specified address. It decreases the total supply and the balance of the specified address. An event Burn is emitted upon successful burning. The function includes a requirement that the address must have a sufficient balance to burn the specified amount of tokens.


function burn(address _address, uint _value) public {
    require(balances[_address] >= _value, "Insufficient balance");
    totalSupply -= _value;
    balances[_address] -= _value;
    emit Burn(_address, _value); // Emit event
}

How to Use
Deploy the Contract: Deploy the MyToken contract to the Ethereum blockchain.
Mint Tokens: Use the mint function to create new tokens and assign them to a specified address.
Burn Tokens: Use the burn function to destroy tokens from a specified address, ensuring the address has enough balance.
