pragma solidity ^0.6.1;

library strings {
   function equals (string memory a, string memory b) public view 
       returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );

       }

}

