
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObjectInterface.sol";

contract gameObject is GameObjectInterface {
    
    uint public objectAttack;
    uint public objectDefence;
    uint public objectHelth;
    address public callerAddress;




    /* constructor (uint attack_, uint defence_, uint helth_) public {
        tvm.accept();
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        objectAttack = attack_;
        objectDefence = defence_;
        objectHelth = helth_;

        
    }  */

    function takeAttack (GameObjectInterface myAddress) public {
        tvm.accept();
        myAddress.takeDefence(objectAttack);
    }

    function takeDefence ( uint attack ) virtual external override {
        tvm.accept();
      
        require(objectDefence < attack, 101);
        uint damage;
        damage = attack - objectDefence;
        

        callerAddress = msg.sender;
        if (objectHelth < damage) {
            sendAndDelete(callerAddress);
        } else { objectHelth = objectHelth - damage;

        }
    }

    function sendAndDelete(address dest) internal {
       
        dest.transfer(0 , true, 160);
    }




    

   






}
