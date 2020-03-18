<template>
    <div class="que_general">
        <button class="back_button" v-on:click="back()"><p>BACK</p></button>
        <p class="que_block_titre">QUESTION</p>
        <div class="que_question">
            <p class="que_titre">{{post[0]}}</p>
            <p class="que_desc">
               {{post[1]}}</p>
        </div>
        <p class="que_block_titre">ANSWERS</p>
        <div class="que_answer">
            <div class="que_an_answer" v-for="answer in answers" v-bind:key="answer">
                <div class="que_vote">
                    <svg   v-if="answer[2]" class="que_svg"
                            version="1.1" 
                            id="Layer_1" 
                            xmlns="http://www.w3.org/2000/svg" 
                            xmlns:xlink="http://www.w3.org/1999/xlink" 
                            x="0px" 
                            y="0px"
                            viewBox="0 0 512 512" 
                            style="enable-background:new 0 0 512 512;" 
                            xml:space="preserve">
                        <ellipse style="fill:#32BEA6;" cx="256" cy="256" rx="256" ry="255.832"/>
                        <polygon style="fill:#FFFFFF;" points="235.472,392.08 114.432,297.784 148.848,253.616 223.176,311.52 345.848,134.504, 391.88,166.392 "/>
                    </svg>
                    <p class="que_nbr_vote">{{answer[3]}}</p>
                </div>
                <p class="que_answer_answer">{{answer[0]}}</p>
                <button class="que_button" v-on:click="vote(answer[4])">VOTE</button>
            </div>
        </div>
        <p class="que_block_titre">YOUR ANSWER</p>
        <div class="que_text">
            <textarea class="que_type" placeholder="Type here" v-model="text"></textarea>
            <div class="que_button_send">
                <button class="que_button_send_type" v-on:click="answer()">Post your answer</button>
            </div>
        </div>
    </div>
</template>

<script>
import Web3 from 'web3'
import userContract_abi from '../../../build/contracts/UserCrypto.json'
import postContract_abi from '../../../build/contracts/PostFactory.json'

export default {
    data: function(){
        return{
            post:[],
            answers:[],
            text:""
        }
    },
    methods:{
        back: function(){
            this.$router.push("search");
            this.$route.params.id;
        },
        async getPost(id){
                    let web3 = window.web3;
                    const NameContract = new web3.eth.Contract(userContract_abi.abi, "0x0E56465FDC52951396826449E8C8c266d60cB64f");
                    const NameContractpost = new web3.eth.Contract(postContract_abi.abi, "0x283EA5a7b7C5719d3256533E297dCE93E9f1F216");
                    this.post= await NameContractpost.methods.getPostById(id).call({from:this.MetaMaskAddress});
                    this.post[6]=await NameContract.methods.getDetails(this.post[5]).call({from:this.MetaMaskAddress});
        },
        async getResponse(id){
                    let web3 = window.web3;
                    const NameContractpost = new web3.eth.Contract(postContract_abi.abi, "0x283EA5a7b7C5719d3256533E297dCE93E9f1F216");
                    this.post= await NameContractpost.methods.getPostById(id).call({from:this.MetaMaskAddress});
                    for(var i=0; i<this.post[4];i++){
                        let answer = await NameContractpost.methods.getAnswerByPost(id,i).call({from:this.MetaMaskAddress});
                        this.answers.push(answer);
                    }
                    console.log(this.answers)
        },
        async answer(){
            let web3 = window.web3;
            const NameContractpost = new web3.eth.Contract(postContract_abi.abi, "0x283EA5a7b7C5719d3256533E297dCE93E9f1F216");
            await NameContractpost.methods.newAnswer(this.text,this.$route.params.id).send({from:this.MetaMaskAddress});
            this.text="";
            this.answers=[];
            this.getResponse(this.$route.params.id);
        },
        async vote(id_res){
            let web3 = window.web3;
            const NameContractpost = new web3.eth.Contract(postContract_abi.abi, "0x283EA5a7b7C5719d3256533E297dCE93E9f1F216");
            await NameContractpost.methods.likeAnswer(this.$route.params.id,id_res).send({from:this.MetaMaskAddress});
            this.answers=[]
            this.getResponse(this.$route.params.id);
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
            this.getPost(this.$route.params.id);
            this.getResponse(this.$route.params.id);
        } else {
            this.web3 = null;
            this.Log(this.MetamaskMsg.METAMASK_NOT_INSTALL, "NO_INSTALL_METAMASK");
            console.error('Non-Ethereum browser detected. You should consider trying MetaMask!');
        }
    }
}
</script>

<style scoped>
.que_block_titre{
    padding-bottom: 30px;
    font-weight: 600;
}
.que_general{
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 80%;
    margin-left: 10%;
    margin-right: 10%;
}
.que_question{
    width: 100%;
    background-color:white;
    border-radius: 10px;
    padding: 50px;
    margin-bottom: 50px;
    text-align:left;
}
.que_titre{
    border-bottom: 1px solid grey;
    padding-bottom: 20px;
    margin-bottom: 50px;
    
}
.que_answer{
    width: 100%;
    background-color:white;
    border-radius: 10px;
    padding-left: 50px;
    padding-bottom: 50px;
    padding-right: 50px;
    padding-top: 30px;
    display: flex;
    flex-direction: column;
    margin-bottom: 50px;
    text-align:left;
    
}
.que_an_answer{
    margin-top: 20px;
    border-bottom: 1px solid grey;
    padding-bottom: 25px;
    width: 100%;
    display: flex;
    flex-direction: row;
}
.que_vote{
    display: flex;
    flex-direction: column;
}
.que_button{
    box-shadow: none;
    border: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    min-width: 200px;
    height: 60px;
    border-radius: 5px;
    box-shadow: none;
    background: rgb(115,153,255);
    background: linear-gradient(90deg, rgba(115,153,255,1) 0%, rgba(2,218,253,1) 100%);
    color: white;
    font-size: 15px;
    font-weight: 700;
    outline: none;
    margin-left: 70px;
    margin-right: 15px;
    margin-top: 15px;
    cursor: pointer;
}
.que_svg{
    min-width: 60px;
    min-height: 0px;
    max-width: 60px;
    max-height: 60px;
    margin-right: 15px;
    margin-left: 15px;
    margin-top: 15px;
}
.que_nbr_vote{
    width: 100%;
    text-align: center;
    margin-top: 20px;
    font-size: 25px;
    font-weight: 700;
}
.que_text{
width: 100%;
background-color:white;
border-radius: 10px;
padding-left: 50px;
padding-bottom: 50px;
padding-right: 50px;
padding-top: 50px;
display: flex;
flex-direction: column;
margin-bottom: 50px;
}
.que_type{
    border-radius: 10px;
    height: 150px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    padding: 10px;
}
.que_button_send{
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
}
.que_button_send_type{
    box-shadow: none;
    border: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    width: 250px;
    height: 60px;
    border-radius: 5px;
    box-shadow: none;
    background: rgb(115,153,255);
    background: linear-gradient(90deg, rgba(115,153,255,1) 0%, rgba(2,218,253,1) 100%);
    color: white;
    font-size: 15px;
    font-weight: 700;
    outline: none;
    margin-top: 20px;
    cursor: pointer;
}
.back_button{
    box-shadow: none;
    border: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    width: 20%;
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