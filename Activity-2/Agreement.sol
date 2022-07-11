pragma solidity >=0.7.0 <0.9.0;

contract Agreement {

    bool partyASigned = false;
    bool partyBSigned = false;

    address partyAAddr;
    address partyBAddr = 0xf32978a188668D6BC25288CA090731AEED73BB44; 

    event partyAPledged(uint256);
    event partyBPledged(uint256);

    uint256 partyAPledge = 0;
    uint256 partyBPledge = 0;

    modifier onlyOwner(){
        require(msg.sender == partyAAddr);
        _;
    }

    modifier onlyCounter(){
        require(msg.sender == partyBAddr);
        _;
    }

    constructor() public{
        partyAAddr = msg.sender;
    }


    function partyAMakePledge(uint256 _pledge) onlyOwner public {
       partyAPledge = _pledge;
       partyBSigned = false;
       partyASigned = false;
       emit partyAPledged(_pledge);
    }

    function partyASign() onlyOwner public {
       partyASigned = true;
    }

    //partyBSign
    //partyBMakePledge

    function getPledges() public view returns(uint256 _partyAPledge, uint256 _partyBPledge) {
        return(partyAPledge, partyBPledge);
    }


}
