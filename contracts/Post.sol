pragma solidity >=0.4.25 <0.7.0;

import "./User.sol";

contract PostFactory {

    struct Post{
        string text;
    }

    Post[] posts;
	mapping (address => uint) ownerToPostMapping;

	mapping (uint => address) postToOwnerMapping;

    function newPost(string memory _text) public {
        posts.push(Post(_text));
        uint id = posts.length-1;
        postToOwnerMapping[id] = msg.sender;
        ownerToPostMapping[msg.sender]++;
    }

    function getOwnerByPost(uint id) public view returns (address){
        return postToOwnerMapping[id];
    }


    function getPostsByOwner(address _owner) public view returns (uint[] memory){
        uint[] memory result = new uint[](ownerToPostMapping[_owner]);
        uint counter = 0;
        for (uint i = 0; i < posts.length; i++) {
            if (postToOwnerMapping[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
}