pragma solidity ^0.8.0;


    contract myContract {

        mapping (address => uint256)  public  Accounts;
        address payable card ;
        address public owner;
        event Clean(uint256);
        
        modifier isOwner {
            require(owner == msg.sender);
            _;
        }

        function makeOwner () public {
            owner = msg.sender;
        }
        
        function getCard (address payable userCard) public {
            card = userCard;
        }

        function getToken () payable public isOwner{
            Accounts[msg.sender] +=1;
            card.transfer(msg.value);
            emit Clean(Accounts[msg.sender]);

        }

    }