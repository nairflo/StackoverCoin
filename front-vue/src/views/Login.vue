<template>
    <div class="login">
        <p class="log_create">LOGIN</p>
        <input type="text" id="log_nickname" placeholder="Nickname" v-model="nickname">
        <input type="password" id="log_password" placeholder="Password" v-model="mdp">
        <button class="log_button" v-on:click="login()">LOGIN</button>
    </div>
</template>

<script>
export default {
    data: function()
    {
        return{
            nickname: "",
            mdp: ""
        }
    },
    methods:{
        login: function(){
            if(this.nickname != "" && this.mdp != "")
            {
                console.log("Login : " + this.nickname + " MDP : " + this.mdp);
                this.$router.push("search");
            }
            else
            {
                console.log("Erreur de saisie");
            }
        }
    }
}
</script>

<style>
.login{
    align-items: center;
    flex-direction: column;
    display: flex;
    width: 550px;
    height: 350px;
    background-color:white;
    border-radius: 10px;
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
}
</style>