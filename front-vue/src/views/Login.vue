<template>
    <div class="login">
        <p class="log_create">LOGIN</p>
        <input type="text" id="log_nickname" placeholder="Nickname" v-model="nickname">
        <input type="password" id="log_password" placeholder="Password" v-model="mdp">
        <button class="log_button" v-on:click="login()">LOGIN</button>
    </div>
</template>

<script>
import Web3 from 'web3'
import userContract_abi from '../../../build/contracts/UserCrypto.json'

export default {
    data: function()
    {
        return{
            nickname: "",
            mdp: ""
        }
    },
    methods:{
        login: async function(){
            if(this.nickname != "" && this.mdp != "")
            {
                console.log("Login : " + this.nickname + " MDP : " + this.mdp);
                let web3 = window.web3;
                const NameContract = new web3.eth.Contract(userContract_abi.abi, "0x0E56465FDC52951396826449E8C8c266d60cB64f");
                let res= await NameContract.methods.login(this.nickname,this.mdp)
                .call({from:this.MetaMaskAddress})
                console.log("Appel de la blockchain pour register");
                if(res===this.MetaMaskAddress){
                    this.$router.push({name:"Recherche"});
                }else{
                    console.log(res)
                }
            }
            else
            {
                console.log("Erreur de saisie");
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
        web3TimerCheck(web3){
            this.web3 = web3;
            this.checkAccounts();
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
    
}
</script>

<style scoped>
.login{
    align-items: center;
    flex-direction: column;
    display: flex;
    width: 550px;
    height: 350px;
    background-color:white;
    border-radius: 10px;
    margin-top: 20px;
}
.log_create{
    margin-top: 40px;
    margin-bottom: 40px;
    font-weight: 900;
    font-size: 25px;
}

#log_nickname, #log_password{
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
.log_button{
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
    cursor: pointer;
}
</style>