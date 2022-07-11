pragma solidity >=0.7.0 <0.9.0;

contract CookieClicker {
    uint clicks = 0;

    
    function clickCookie() public {
       clicks = clicks + 1;
    }

    function clickWithAmount(uint amount) public {
       clicks = clicks + amount;
    }


    function getCookieClicks() public view returns(uint256 _clicks) {
        return(clicks);
    }


}
