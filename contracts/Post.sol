pragma solidity >=0.4.25 <0.7.0;
pragma experimental ABIEncoderV2;
import "./User.sol";

contract PostFactory {

    struct Reponse{
        string text;
        address author;
        State state;
        uint nblike;
        address[] like;
        uint id;
    }

    struct Post{
        string titre;
        string contenue;
        address author;
        uint id;
        uint nbAnswer;
        mapping(uint => Reponse) responses;
    }

    enum State {
        val,
        nonVal
    }

    event validateAnswerEvent(
        address indexed _from,
        uint indexed _id,
        address _author
    );

    event getAllres(
        Reponse[] reponse
    );

    Post[] posts;
	mapping (address => uint) ownerToPostMapping;

	mapping (uint => address) postToOwnerMapping;

event Posted(
    address indexed userAdd,
    string text,
    uint idPost);

event answerPosted(
    Reponse rep
    );

event getAllpostsEvent(uint[] allpostsID);
event likeAnswerEvent(uint idpost, uint idAnswer);

    function newPost(string memory _titre,string memory _text) public {
        uint id = posts.length;
        posts.push(Post(_titre,_text,msg.sender,id,0));
        postToOwnerMapping[id] = msg.sender;
        ownerToPostMapping[msg.sender]++;
        emit Posted(msg.sender,_text,id);
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

    function getAllPost() public view returns(uint[] memory){
        uint[] memory resu = new uint[](posts.length);
        for(uint i = 0; i < posts.length; i++){
            resu[i] = posts[i].id;
        }
        return resu;
    }

    function newAnswer(string memory _text, uint _postid) public returns (bool){
        address[] memory like;
        uint id = posts[_postid].nbAnswer;
        posts[_postid].responses[id] = (Reponse(_text,msg.sender,State.nonVal,0,like,id));
        posts[_postid].nbAnswer++;
        return true;
    }
    function getPostById(uint _postid) public returns (string memory titre,string memory contenue, bool validate, uint nbAnswer, address author){
        bool responseVal = false;
        for(uint i = 0; i<posts[_postid].nbAnswer;i++) {
            if(posts[_postid].responses[i].state==State.nonVal){
                responseVal = true;
            }
        }
        return (posts[_postid].titre,posts[_postid].contenue,responseVal,posts[_postid].nbAnswer,posts[_postid].author);
    }

    function getAnswersByPost(uint _post) public returns (Reponse[] memory){
        Reponse[] memory res;
        for(uint i = 0;i<posts[_post].nbAnswer;i++){
            res[i] = (posts[_post].responses[i]);
        }
        emit getAllres(res);
        return res;
    }

    function likeAnswer(uint _post, uint _id) public {
        posts[_post].responses[_id].like[posts[_post].responses[_id].nblike] = msg.sender;
        posts[_post].responses[_id].nblike++;
        emit likeAnswerEvent(_post,_id);
    }

    function validateAnswer(uint _post, uint _id) public{
        posts[_post].responses[_id].state = State.val;
        emit validateAnswerEvent(msg.sender,_id,posts[_post].responses[_id].author);
    }
}