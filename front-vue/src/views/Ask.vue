<template>
    <div class="ask_block">
        <p class="ask_create">Ask your question</p>
        <div class="ask">
            <p class="ask_question">Question</p>
            <input type="text" id="ask_titre" placeholder="Question title" v-model="titre">
            <p class="ask_desc">Content</p>
            <textarea id="ask_description" placeholder="Ask your question" v-model="desc"></textarea>
            <div class="ask_barre_button">
                <button class="back_button" v-on:click="back()"><p>BACK</p></button>
                <button class="ask_button" v-on:click="ask()"><p>ASK YOUR QUESTION</p></button>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: function(){
        return{
            titre: "",
            desc: ""
        }
    },
    methods:{
        back: function(){
            this.$router.push("search");
        },
        ask: function(){
            if(this.titre != "" && this.desc != "")
            {
                console.log("Ask " + this.titre);
                console.log(this.desc);
                this.$router.push("search"); 
            }
            else
            {
                console.log("Erreur saisie");
            }
        }
    }
}
</script>

<style scoped>
.ask_block{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-left: 10%;
    margin-right: 10%;
    width: 80%;
}
.ask{
    align-items: center;
    flex-direction: column;
    display: flex;
    width: 100%;
    background-color:white;
    border-radius: 10px;
    padding-top: 40px;
    padding-bottom: 40px;;
}
.ask_create{
    padding-bottom: 15px;
    font-weight: 600;
    width: 100%;
    margin-top: 25px;
}

#ask_titre{
    width: 80%;
    height: 40px;
    margin-top: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    box-shadow: none;
    border: 1px solid gray;
    padding-left: 10px;
    outline: none;
}

#ask_description{
    width: 80%;
    height: 100px;
    margin-top: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    box-shadow: none;
    border: 1px solid gray;
    padding-left: 10px;
    outline: none;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    padding: 10px;
}
.ask_barre_button{
    width: 80%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
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
.ask_button{
    box-shadow: none;
    border: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    width: 70%;
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
.ask_question{
    width: 80%;
}
.ask_desc{
    width: 80%;
    margin-top: 20px;
}
</style>