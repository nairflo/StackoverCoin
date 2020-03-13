<template>
    <div class="forum">
        <div class="barre_recherche">
            <p class="title">FIND A QUESTION</p>
            <div class="haut">
                <div class="barre">
                    <input type="text" id="recherche" placeholder="Type your question">
                    <button class="bouton1"><p id="search_button">Search</p><svg height="32px" version="1.1" viewBox="0 0 32 32" width="32px" xmlns="http://www.w3.org/2000/svg" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns" xmlns:xlink="http://www.w3.org/1999/xlink"><title/><desc/><defs/><g fill="none" fill-rule="evenodd" id="Page-1" stroke="none" stroke-width="1"><g fill="white" id="icon-111-search"><path d="M19.4271164,20.4271164 C18.0372495,21.4174803 16.3366522,22 14.5,22 C9.80557939,22 6,18.1944206 6,13.5 C6,8.80557939 9.80557939,5 14.5,5 C19.1944206,5 23,8.80557939 23,13.5 C23,15.8472103 22.0486052,17.9722103 20.5104077,19.5104077 L26.5077736,25.5077736 C26.782828,25.782828 26.7761424,26.2238576 26.5,26.5 C26.2219324,26.7780676 25.7796227,26.7796227 25.5077736,26.5077736 L19.4271164,20.4271164 L19.4271164,20.4271164 Z M14.5,21 C18.6421358,21 22,17.6421358 22,13.5 C22,9.35786417 18.6421358,6 14.5,6 C10.3578642,6 7,9.35786417 7,13.5 C7,17.6421358 10.3578642,21 14.5,21 L14.5,21 Z" id="search"/></g></g></svg></button>
                </div>
                <div class="ask">
                    <button class="bouton2" v-on:click="goToAsk()"><p class="ask_bouton">ASK QUESTION</p></button>
                </div>
            </div>
        </div>
        <div class="result">
            <p class="title2">LATEST QUESTIONS</p>
            <div class="print_result">
                <div class="column">
                    <p class="cat1  ">TITLE</p>
                    <p class="cat2">RESUME</p>
                    <p class="cat3">PUBLICATION DATE</p>
                    <p class="cat3">WRITER</p>
                    <p class="cat3">ANSWERED</p>
                </div>
                <div class="block_question" v-on:click="goToQuestion()">
                    <p class="cat4">What are CN, OU, DC in an LDAP search?</p>
                    <div class="cat5">
                        <p class="long">These are all parts of the X.500 Directory Specification, which defines nodes in a LDAP directory. You can also read up on LDAP data Interchange Format (LDIF), which is an alternate format. You read it from right to left, the right-most component is the root of the tree,</p>
                    </div>
                    <p class="cat6">09/07/19</p>
                    <p class="cat6">Johnny</p>
                    <p class="cat6">YES</p>
                </div>
                <div class="block_question" v-on:click="goToQuestion()">
                    <p class="cat4">What are CN, OU, DC in an LDAP search?</p>
                    <div class="cat5">
                        <p class="long">These are all parts of the X.500 Directory Specification, which defines nodes in a LDAP directory. You can also read up on LDAP data Interchange Format (LDIF), which is an alternate format. You read it from right to left, the right-most component is the root of the tree,</p>
                    </div>
                    <p class="cat6">09/07/19</p>
                    <p class="cat6">Johnny</p>
                    <p class="cat6">NO</p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: function(){
        return{

        }
    },
    methods:{
        goToAsk: function(){
            this.$router.push("ask");
        },
        goToQuestion: function(){
            this.$router.push("question");
        }
    }
}
</script>

<style>
.forum{
    margin-top: 5%;
    margin-left: 10%;
    margin-right: 10%;
    width: 80%;
    
}
.barre_recherche, .result{
    width: 100%;
    display: flex;
    flex-direction: column;
}

.haut{
    width: 100%;
    display: flex;
    flex-direction: row;
}
.barre{
    width: 65%;
    height: 100px;
    background: rgb(115,153,255);
    background: linear-gradient(90deg, rgba(115,153,255,1) 0%, rgba(2,218,253,1) 100%);
    display: flex;
    flex-direction: row;
    align-items: center;
    padding-left: 50px;
    border-radius: 10px;
}
#recherche{
    width: 700px;
    height: 40px;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-right: 50px;
    border-radius: 20px;
    box-shadow: none;
    border: 0;
    padding-left: 25px;
    outline: none;
    background-color: #3779BB;
    color: white;
}

::-webkit-input-placeholder { /* Edge */
    color:white;
    font-family: 'Roboto', sans-serif;
  }
  
:-ms-input-placeholder { /* Internet Explorer 10-11 */
color: white;
font-family: 'Roboto', sans-serif;
}

::placeholder {
color: white;
font-family: 'Roboto', sans-serif;
}
.bouton1{
    display: flex;
    flex-direction: row;
    align-items: center;
    background-color: transparent;
    border: 1px solid white;
    color: white;
    height: 40px;
    border-radius: 20px;
    padding-left: 20px;
    padding-right: 20px;
    margin-right: 20px;
    box-shadow: none;
    outline: none;
}
p{
    padding: 0;
    margin: 0;
}
svg{
    color: white;
}
#search_button{
    margin-right: 5px;
}
.ask{
    width: 30%;
    margin-left: 5%;
    height: 100px;
    background-color: white;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.title{
    padding-bottom: 30px;
    font-weight:600;
}
.title2{
    margin-top: 75px;
    padding-bottom: 30px;
    font-weight:600;
}
.print_result{
    width: 100%;
    background-color: white;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-left: 60px;
    padding-right: 60px;
    padding-top: 40px;
}
.column{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    padding-bottom: 20px;
}
.cat1{
    width: 25%;
    font-weight:600;
    padding-left: 5px;
    padding-right: 5px;
}
.cat2{
    width: 30%;
    font-weight:600;
    overflow: hidden;
    padding-left: 5px;
    padding-right: 5px;
}
.cat3{
    width: 15%;
    font-weight:600;
    padding-left: 5px;
    padding-right: 5px;
    display: flex;
    justify-content: center;
}
.block_question{
    width: 100%;
    border-top: 1px solid black;
    display: flex;
    flex-direction: row;
    align-items: center;
    padding-bottom: 20px;
    padding-top: 20px;
}

.cat4{
    width: 25%;
    height: 50px;
    padding-left: 5px;
    padding-right: 5px;
    display: flex;
    align-items: center;
}
.cat5{
    width: 30%;
    height: 50px;
    padding-left: 5px;
    padding-right: 5px;
    display: flex;
    align-items: center;
}
.cat6{
    width: 15%;
    height: 50px;
    padding-left: 5px;
    padding-right: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.long{
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
}
.bouton2{
    width: 250px;
    height: 60px;
    border-radius: 10px;
    outline: none;
    box-shadow: none;
    border: 0;
    background: rgb(115,153,255);
    background: linear-gradient(90deg, rgba(115,153,255,1) 0%, rgba(2,218,253,1) 100%);
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
}
</style>