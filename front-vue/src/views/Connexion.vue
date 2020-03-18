<template>
    <div class="inscription">
        <p class="create">CREATE ACCOUNT</p>
        <input type="text" id="nickname" placeholder="Nickname" v-model="formulaire.pseudo">
        <input type="email" id="email" placeholder="E-mail" v-model="formulaire.mail">
        <input type="password" id="password" placeholder="Password" v-model="formulaire.mdp">
        <input type="password" id="password-repeat" placeholder="Repeat your password" v-model="formulaire.mdp2">
        <button v-on:click="register()">SIGN UP</button>
        <div class="login_page">
            <p>Have already an account?</p>
            <a v-on:click="goToLogin()">Login here</a>
        </div>
    </div>
</template>

<script>
import Web3 from 'web3'
import userContract_abi from '../../../build/contracts/UserCrypto.json'
export default {
    data: function(){
        return{
            formulaire:{
                pseudo: "",
                mail: "",
                mdp: "",
                mdp2: ""
            }
        }
    },
    methods:{
        goToLogin: function(){
            this.$router.push('login');
        },
        register: async function(){
            console.log(this.formulaire);
            if( this.formulaire.pseudo !== "" &&
                this.formulaire.mail !== "" &&
                this.formulaire.mdp !== "" &&
                this.formulaire.mdp2 !== "" &&
                this.formulaire.mdp === this.formulaire.mdp2)
            {
                let web3 = window.web3;
                const NameContract = new web3.eth.Contract(userContract_abi.abi, "0xf98d1B951606Cb896CAE6413F6490535FCdF9Ca3");
                let res= await NameContract.methods.register(this.formulaire.mail,this.formulaire.pseudo,this.formulaire.mdp,"")
                .send({from:this.MetaMaskAddress})
                console.log(res);
                console.log("Appel de la blockchain pour register");
                this.goToLogin();  
            }
            else
            {
                console.log("Erreur de saisie");
                
            }
        }, 
        checkWeb3() {
            let web3 = window.web3;
            if (typeof web3 === 'undefined') {
                this.web3 = null;
                this.Log(this.MetamaskMsg.METAMASK_NOT_INSTALL, "NO_INSTALL_METAMASK");
            }
        },
        checkAccounts() {
            if (window.ethereum) {
                window.web3 = new Web3(window.ethereum);
                try {
                    // Request account access if needed
                    window.ethereum.enable();
                } catch (error) {
                    // User denied account access...
                }
            } else if (window.web3) { // Legacy dapp browsers...
                window.web3 = new Web3(window.web3.currentProvider);
            } else { // Non-dapp browsers...
                console.log('Non-Ethereum browser detected. You should consider trying MetaMask!');
            }
            this.web3=window.web3;
            this.web3.eth.getAccounts((err, accounts) => {
            if (err != null) return this.Log(this.MetamaskMsg.NETWORK_ERROR, "NETWORK_ERROR");
                if (accounts.length === 0){
                    this.MetaMaskAddress = "";
                    this.Log(this.MetamaskMsg.EMPTY_METAMASK_ACCOUNT, 'NO_LOGIN');
                    return;
                } 
                console.log(this.MetaMaskAddress)
                this.MetaMaskAddress = accounts[0]; // user Address
            });
        },
        Log(msg, type=""){
            const letType = type;
            if(letType === this.type) return;
            const message = this.userMessage === "null" ? msg : this.userMessage;
            this.type = type;
            this.$emit("onComplete", {
                web3: this.web3,
                type,
                metaMaskAddress: this.MetaMaskAddress,
                message,
                netID: this.netID,
            });
        },
        web3TimerCheck(web3){
            this.web3 = web3;
            this.checkAccounts();
            this.Web3Interval = setInterval(()=> this.checkWeb3(), 1000);
            this.AccountInterval = setInterval(()=> this.checkAccounts(), 1000);
        }
    },
    async mounted(){
        if (window.web3) {
            window.web3 = new Web3(window.web3.eth.currentProvider);
            this.web3TimerCheck(window.web3);
        } else {
            this.web3 = null;
            this.Log(this.MetamaskMsg.METAMASK_NOT_INSTALL, "NO_INSTALL_METAMASK");
            console.error('Non-Ethereum browser detected. You should consider trying MetaMask!');
        }
    }
};

</script>

<style scoped>
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
    margin-top: 20px;
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
     cursor: pointer;
 }
</style>