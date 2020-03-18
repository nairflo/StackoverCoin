<template>
    <div class="que_general">
        <button class="back_button" v-on:click="back()"><p>BACK</p></button>
        <p class="que_block_titre">QUESTION</p>
        <div class="que_question">
            <p class="que_titre">What are CN, OU, DC in an LDAP search?</p>
            <p class="que_desc">
                I've been in touch with LDAP in many projects I've been involved in but, the truth be told, I don't really understand it. I thought it was just a person directory but after I discovered that it can contain any objects in a hierarchical structure.
                I installed openldap in my box and I found many tutorials regarding just the installation.
                What is LDAP? What are the scenarios where LDAP is the right choice? What are the LDAP concepts I should know for working with it? What are the advantages of LDAP? Is it used just because old applications used it? Is there a good doc anywhere on internet explaining all this questions?
            </p>
        </div>
        <p class="que_block_titre">ANSWERS</p>
        <div class="que_answer">
            <div class="que_an_answer">
                <div class="que_vote">
                    <svg    class="que_svg"
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
                    <p class="que_nbr_vote">19</p>
                </div>
                <p class="que_answer_answer">hat is LDAP? What are the scenarios where LDAP is the right choice? What are the LDAP concepts I should know for working with it? What are the advantages of LDAP? Is it used just because old applications used it? Is there a good doc anywhere on internet explaining all this question DITs are a hierarchical description scheme that lend themselves to B-Tree algos very nicely, resulting in tremendous search performance in most cases. Directory Server like OpenDS return indexed searches in micro-seconds, whereas RDBMS systems are much slower. Directory Servers (often called LDAP servers) trade resources (RAM, CPU) for fast read response. RDBMS systems provide greater functionality in terms of management of data in question. Need speed with few or zero updates, simplicity, and small network protocol? Use a Directory Server. Need data management and mining capabilities, and/or high rate-of-change of the database with relational aspects defined between data? Use an RDBMS (MySQL is your best bet here).</p>
                <button class="que_button">VOTE</button>
            </div>
            <div class="que_an_answer">
                <div class="que_vote">
                    <div class="que_svg"></div>
                        <p class="que_nbr_vote">2</p>
                    </div>
                    <p class="que_answer_answer">hat is LDAP? What are the scenarios where LDAP is the right choice? What are the LDAP concepts I should know for working with it? What are the advantages of LDAP? Is it used just because old applications used it? Is there a good doc anywhere on internet explaining all this question DITs are a hierarchical description scheme that lend themselves to B-Tree algos very nicely, resulting in tremendous search performance in most cases. Directory Server like OpenDS return indexed searches in micro-seconds, whereas RDBMS systems are much slower. Directory Servers (often called LDAP servers) trade resources (RAM, CPU) for fast read response. RDBMS systems provide greater functionality in terms of management of data in question. Need speed with few or zero updates, simplicity, and small network protocol? Use a Directory Server. Need data management and mining capabilities, and/or high rate-of-change of the database with relational aspects defined between data? Use an RDBMS (MySQL is your best bet here).</p>
                    <button class="que_button">VOTE</button>
                </div>
            </div>
            <p class="que_block_titre">YOUR ANSWER</p>
            <div class="que_text">
                <textarea class="que_type" placeholder="Type here"></textarea>
                <div class="que_button_send">
                <button class="que_button_send_type">Post your answer</button>
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
        back: function(){
            this.$router.push("search");
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