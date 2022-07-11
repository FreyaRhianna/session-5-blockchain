pragma solidity >=0.7.0 <0.9.0;


contract Raffle {
    address owner;
    bool ended = false;
    mapping(address => string) public entries;
    address winner;
    string prize;
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

     modifier onlyWinner(){
        require(msg.sender == winner);
        _;
    }
    event EntryRegistered(string);
   
    constructor() public{
        owner = msg.sender;
    }

    function register(string memory _name) public{
        entries[msg.sender] = _name;
        emit EntryRegistered(_name);
    }

    function getWinner() public view returns(string memory name){
        require(ended);
        return(entries[winner]);
    }

    function setWinner(address _addr) onlyOwner public{
        winner =_addr;
        ended = true;
    }

    function setPrize(string memory _prize) onlyOwner public{ 
        prize = _prize;
    }

    function getPrize() onlyWinner public view returns (string memory _prize){
        return(prize);
    }
   

}
