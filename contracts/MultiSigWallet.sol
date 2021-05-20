pragma solidity >=0.4.22 <0.9.0;

contract MultiSigWallet {

    //Events declarations
    event Deposit(address indexed sender, uint amount, uint balance);
    event SubmitTransaction(
        address indexed owner,
        uint indexed txIndex,
        address indexed to,
        uint value,
        bytes data
    );
    event ConfirmTransaction(address indexed owner, uint indexed txIndex);
    event RevokeConfirmation(address indexed owner, uint indexed txIndex);
    event ExecuteTransaction(address indexed owner, uint indexed txIndex);

    //Transaction struct
    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
        uint numConfirmation;
    }

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public numConfirmationsRequired;
    
    //txIndex => owner => bool
    mapping(uint => mapping(address => bool)) public isConfirmed;
    Transaction[] public transactions;

    modifier onlyOwner(){
        require(isOwner[msg.sender],"not owner");
        _;
    }



}