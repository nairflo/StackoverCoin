const User = artifacts.require("UserCrypto");
const Post = artifacts.require("PostFactory");

contract("User", accounts => {
    it("register", async() =>{
      let user=await User.deployed();
      let register= await user.register.call("_pseudo", "email","_password", "avatar");
      let post= await Post.deployed();
      await post.newPost("test");
      await post.newPost("test2");
      let allpost=await post.getAllPost.call();
      let test=0;
      let res=await post.newAnswer("test",test);
      console.log(test)

      let allRes=await post.getAnswersByPost.call(test);
      console.log(allRes)
      assert.equal(true,false,"tes")
      })
})