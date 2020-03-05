pragma solidity >=0.4.25 <0.7.0;

import "./Post.sol";

contract Answer {

    enum State {
        val,
        nonVal
    }

    struct Answer{
        string text;
        State state;
    }

    Answer[] answers;
	mapping (address => uint) ownerToAnswerMapping;

	mapping (uint => address) answerToOwnerMapping;

	mapping (address => uint[]) postToAnswerMapping;

    function newAnswer(string memory _text, address _adressPost) public {
        answers.push(Answer(_text,State.nonVal));
        uint id = answers.length-1;
        answerToOwnerMapping[id] = msg.sender;
        ownerToAnswerMapping[msg.sender]++;
        uint[] storage res = postToAnswerMapping[_adressPost];
        res.push(id);
        postToAnswerMapping[_adressPost] = res;
    }

    function getOwnerByPost(uint id) public view returns (address){
        return answerToOwnerMapping[id];
    }

    function getAnswerByPost(address _owner) public view returns (uint[] memory){
        uint[] memory result = new uint[](ownerToAnswerMapping[_owner]);
        uint counter = 0;
        for (uint i = 0; i < answers.length; i++) {
            if (answerToOwnerMapping[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }

    function getPostsByOwner(address _owner) public view returns (uint[] memory){
        uint[] memory result = new uint[](ownerToAnswerMapping[_owner]);
        uint counter = 0;
        for (uint i = 0; i < answers.length; i++) {
            if (answerToOwnerMapping[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
}