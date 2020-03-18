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
    function getPostById(uint _postid) public view returns (string memory titre,string memory contenue,uint id,
     bool validate, uint nbAnswer, address author){
        bool responseVal = false;
        for(uint i = 0; i<posts[_postid].nbAnswer;i++) {
            if(posts[_postid].responses[i].state==State.nonVal){
                responseVal = true;
            }
        }
        return (posts[_postid].titre,posts[_postid].contenue,_postid,responseVal,posts[_postid].nbAnswer,posts[_postid].author);
    }
        mapping(uint => Reponse) responses;

    function getAnswerByPost(uint _post, uint _id) public view returns (string memory text,address author,bool state,uint nblike,uint id,address[] memory likeur){
        return (posts[_post].responses[_id].text, posts[_post].responses[_id].author,
         posts[_post].responses[_id].state==State.val,posts[_post].responses[_id].nblike,posts[_post].responses[_id].id,posts[_post].responses[_id].like);
    }

    function likeAnswer(uint _post, uint _id) public {
        require(msg.sender!=posts[_post].responses[_id].author, "You can't like your own answer");
        bool alreadylike = false;
        for (uint i; i<posts[_post].responses[_id].nblike++; i++){
            if(posts[_post].responses[_id].like[i]==msg.sender){
                alreadylike = true;
            }
        }
        require(alreadylike, "You can't like twice the same answer answer");
        posts[_post].responses[_id].like.push(msg.sender);
        posts[_post].responses[_id].nblike++;
    }

    function validateAnswer(uint _post, uint _id) public{
        require(msg.sender==posts[_post].author, "You can't validate if is not your post");
        require(msg.sender==posts[_post].responses[_id].author, "You can't validate your own answer");
        posts[_post].responses[_id].state = State.val;
    }
}