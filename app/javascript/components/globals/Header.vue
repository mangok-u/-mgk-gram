<template>
  <div id="header">
    <div class="header">
      <div class="header-left">
        <!-- <h2 class="header-left_name">Mgkgram</h2> -->
        <h2 class="header-left_name" ><router-link to="/">Mgkgram</router-link></h2>
      </div>
      <ul class="header-right">
        <li class="header-right_icon" ><router-link to="/posts/new">post</router-link></li>
        <li @click="logout" class="header-right_icon">Logout</li>
        <li class="header-right_icon">#</li>
        <li class="header-right_icon">#</li>
      </ul>
    </div>
  </div>
</template>

<script>

import firebase from 'firebase'
import axios from 'axios';
export default{

methods:{
  logout(){
    firebase
        .auth()
        .signOut()
        .then(() => {
          this.$store.commit("setUser", null);
          this.$router.push("/user/login");
        })
        .catch(error => {
          console.log(error);
        });
  }
}

}

</script>

<style scoped lang="scss">
#header{
  width:100%;
  position:fixed;
  background:white;
  z-index:9;
  top:0;
}
#header.get-opacity{
  opacity:0.5;
}
.header{
  width:90%;
  max-width:970px;
  height:60px;
  align-items: center;
  margin:0 auto;
  justify-content:space-between;
  display:flex;
  letter-spacing: 1.2px;
  font-size:1.6rem;
  &-left{
    width:50%;
    &_name{
      font-size:2rem;
      font-family:'Tahoma';
      // font-weight: bold;
    }
    }
   &-right{
    display:inline-flex;   
    &_icon{
      margin-left:20px;
    }
}
}

</style>