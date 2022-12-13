pragma solidity >=0.7.0 <0.9.0;

contract CoinX{

    uint totalSupply;
    uint balances;
    
    mapping(address => uint) public mitb;

    function mine(uint mined) public {
        mitb[msg.sender] += mined;
    }

    function transfer(address receiver, uint amount) public{
        require(mitb[msg.sender] >= amount,"Insufficient Balance");
        mitb[msg.sender] -= amount;
        mitb[receiver] += amount;
    }

    function balanceOf() public view
        returns(uint bal)
        {
            bal = mitb[msg.sender];
        }
}