<template>
  <!-- <div v-if="this.user.id<=1" > -->
  <div id="app">
   
    <Header></Header>
    <router-view></router-view>
  
   
  </div>

  <!-- <router-view v-else name="login"></router-view> -->
 
</template>

<script>
import axios from 'axios';
import firebase from 'firebase'
import 'normalize.css'
import Header from './components/globals/Header.vue' 
import LoginPage from './components/sign/LoginPage.vue' 

export default{
  data(){
    return{
      user:{}
    }
  },
  created(){
    console.log('hoge')
    
    firebase.auth().onAuthStateChanged(async user => {
        if (user) {
            const { data } = await axios.get(`api/v1/users?uid=${user.uid}`)
            console.log("ログインしているユーザー:", data)
            this.$store.commit("setUser", data)
        } else {
            this.$store.commit("setUser", null)
        }
    });
  },
  components:{
    LoginPage,
    Header
  },
  
  
   
}

</script>

<style>

*{
  box-sizing:border-box;
}
html{
  font-size:62.5%;
}
body{
  font-family: "Montserrat","游ゴシック",YuGothic,"ヒラギノ角ゴ ProN W3","Hiragino Kaku Gothic ProN","メイリオ",Meiryo,sans-serif;
  color:#404040;


}

a{
  text-decoration: none;
  color:#404040;
}


ul{
  list-style: none;
}

img{
  vertical-align: bottom;
}

.container{
  width:90%;
  max-width:970px;
  margin:0 auto;
  padding-top:30px;
}
</style>