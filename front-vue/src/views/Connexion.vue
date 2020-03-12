<template>
    <div class="inscription">
        <p class="create">CREATE ACCOUNT</p>
        <input type="text" id="nickname" placeholder="Nickname">
        <input type="email" id="email" placeholder="E-mail">
        <input type="password" id="password" placeholder="Password">
        <input type="password" id="password" placeholder="Repeat your password">
        <button><p>SIGN UP</p></button>
        <div class="login_page">
            <p>Have already an account?</p>
            <a href="https://openclassrooms.com">Login here</a>
        </div>
    </div>
</template>

<script>
import Web3 from 'web3'
import userJson from '../../../build/contracts/UserCrypto.json'

var web3 = new Web3(Web3.currentProvider)
var userContract = new web3.eth.Contract(userJson.abi, "0x893Cfd486C10B1f18d0963C44d56B1eE954C565E")
var userAccount

web3.eth.getAccounts().then(function(r){console.log(r);
})

setInterval(function(){
    if(web3.eth.accounts[0] !== userAccount)
    {
        userAccount = web3.eth.accounts[0]
    }
}, 100)
console.log(web3.eth.accounts[0]);

userContract.methods.login("bite").send({from:"0x50Ec9617b5da73Bcc627fD1C61Df7DCe587BC99b"}).then(function(receipt){
    console.log(receipt);
})

export default {
    
}
</script>

<style>
*{
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
    text-decoration: none;
}
html, body{
    display: flex;
    width: 100%;
    height: 100%;   
    margin: 0;
    background-color: whitesmoke;
}
body{
    justify-content: center;
    align-items: center;
    flex-direction: row;
}
.inscription{
    align-items: center;
    flex-direction: column;
    display: flex;
    width: 550px;
    height: 550px;
    background-color:white;
    border-radius: 10px;
}
.create{
    margin-top: 40px;
    margin-bottom: 40px;
    font-weight: 900;
    font-size: 25px;
}

#nickname, #password, #email{
    width: 400px;
    height: 40px;
    margin-top: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    box-shadow: none;
    border: 1px solid gray;
    padding-left: 10px;
    outline: none;
}
button{
    box-shadow: none;
    border: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    width: 400px;
    height: 40px;
    margin-top: 30px;
    margin-bottom: 10px;
    border-radius: 5px;
    box-shadow: none;
    background: rgb(115,153,255);
    background: linear-gradient(90deg, rgba(115,153,255,1) 0%, rgba(2,218,253,1) 100%);
    color: white;
    font-size: 15px;
    font-weight: 700;
    outline: none;
}
.login_page{
    margin-top: 45px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-direction: column;
    height: 45px;

}
 p,a{
     margin: 0;
 }

 a{
     color: black;
     text-decoration-color: black;
     text-decoration: underline;
 }
</style>