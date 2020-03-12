<template>
    <div class="inscription">
        <p class="create">CREATE ACCOUNT</p>
        <input type="text" id="nickname" placeholder="Nickname">
        <input type="email" id="email" placeholder="E-mail">
        <input type="password" id="password" placeholder="Password">
        <input type="password" id="password-repeat" placeholder="Repeat your password">
        <button>SIGN UP</button>
        <div class="login_page">
            <p>Have already an account?</p>
            <a href="https://openclassrooms.com">Login here</a>
        </div>
    </div>
</template>

<script>
/*import Web3 from 'web3'
import userJson from '../../../build/contracts/UserCrypto.json'

var web3 = new Web3("http://127.0.0.1:8545")
var userContract = new web3.eth.Contract(userJson.abi, "0x5CAB4B21f7ED9DE11b33ce8D457a689A15576bE4")

userContract.methods.login( "mdp").send({from:"0x36E469C35E7B5129a959fdbDa723ED5292E40D4e", gas:1000000}).then(function(receipt){
    console.log(receipt);
})*/

export default {
    data: function(){
        return{
            
        }
    },
    methods:{

    }
}
</script>

<style>
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
    background-color:white;
    border-radius: 10px;
    max-width: 512px;
    width: 100%;
    padding-bottom: 20px;
}
.create{
    margin-top: 40px;
    margin-bottom: 40px;
    font-weight: 900;
    font-size: 2rem;
}

#nickname, #password, #email, #password-repeat{
    width: 75%;
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
    width: 90%;
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

button:hover{
    cursor: pointer;
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