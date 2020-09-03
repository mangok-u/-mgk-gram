<template>
  <!-- <div v-if="this.user.id<=1" > -->
  <div id="app">
   
    <template v-if="isLogin">
      <Header></Header>
      <router-view></router-view>
      <Footer></Footer>
    </template>

    <template v-else>
      <router-view name="noAuth"></router-view>
    </template>
  </div>

  <!-- <router-view v-else name="login"></router-view> -->
 
</template>

<script>
import axios from 'axios';
import firebase from 'firebase'
import 'normalize.css'
import Header from './components/globals/Header' 
import Footer from './components/globals/Footer' 
import LoginPage from './components/sign/LoginPage'

export default{
  data(){
    return{
      user:{},
      isLogin:false
    }
  },
  mounted(){
    firebase.auth().onAuthStateChanged(async user => {
        if (user) {
            const { data } = await axios.get(`api/v1/users?uid=${user.uid}`)
            console.log("ログインしているユーザー:", data)
            this.$store.commit("setUser", data)
            this.user=this.$store.state.currentUser
            this.isLogin=true;
            console.log(this.user)
        } else {
            this.$store.commit("setUser", null)
            this.isLogin=false;
            console.log(this.user)
        }
    });

  },
  created(){
    console.log('hoge')
    
    firebase.auth().onAuthStateChanged(async user => {
        if (user) {
            const { data } = await axios.get(`api/v1/users?uid=${user.uid}`)
            console.log("ログインしているユーザー:", data)
            this.$store.commit("setUser", data)
            this.user=this.$store.state.currentUser
            console.log(this.user)
        } else {
            this.$store.commit("setUser", null)
        }
    });
  },
  components:{
    LoginPage,
    Header,
    Footer
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