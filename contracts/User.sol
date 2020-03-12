pragma solidity >=0.4.25 <0.7.0;

import "./librairy/strings.sol";

contract UserCrypto {
    using strings for *;

    struct User{
        string pseudo;
        string email;
        bytes32 password;
        uint regId;
        bool registered;
        string avatar;
    }

    mapping (address => User) private data;
    mapping (string => address) private emailXadd;
    mapping (string => address) private nameXadd;
    uint id;


    event Registered(
    address indexed userAdd,
    string userName,
    string  userEmail,
    uint userRegId);

    event Loginemit(
    address indexed userAdd,
    string userName,
    string  userEmail,
    uint userRegId);

    modifier alreadyRegistered() {
        require(!data[msg.sender].registered,"already registered");
        _;
    }
    modifier emailAlreadyRegistered(string memory _email) {
        require(!_email.equals(data[msg.sender].email),"email already registered");
        _;
    }
    function register(string memory _pseudo, string memory _email,string memory _password, string memory avatar) public alreadyRegistered
    emailAlreadyRegistered(_email)
    returns(bool){
        bytes32 password = keccak256(abi.encodePacked(_password));
        data[msg.sender] = User(_pseudo,_email,password,id++,true,avatar);
        emailXadd[_email] = msg.sender;
        emit Registered(msg.sender,_pseudo,_email,id);
        return true;
    }

    function login(string memory _password) public returns (address){
        require(data[msg.sender].registered,"your address is not registered");
        require(keccak256(abi.encodePacked(_password)) == data[msg.sender].password,"Incorrect password");
        emit Loginemit(msg.sender,data[msg.sender].pseudo,data[msg.sender].email,data[msg.sender].regId);
        return (msg.sender);
    }
    
    function loginOnChain(string memory _password) public returns (address){
        require(data[msg.sender].registered,"your address is not registered");
        require(keccak256(abi.encodePacked(_password)) == data[msg.sender].password,"Incorrect password");
        emit Loginemit(msg.sender,data[msg.sender].pseudo,data[msg.sender].email,data[msg.sender].regId);
        return (msg.sender);
    }
    
    function getDetails()
    public
    view
    returns(
    string memory pseudo,
    string memory email,
    uint regId,
    string memory avatar){
        require(data[msg.sender].registered,"not registered");
        return (
        data[msg.sender].pseudo,
        data[msg.sender].email,
        data[msg.sender].regId,
        data[msg.sender].avatar);
    }
}
