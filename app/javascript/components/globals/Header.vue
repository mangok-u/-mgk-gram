<template>
  <div id="header">
    <div class="header">
      <div class="header-left">
        <!-- <h2 class="header-left_name">Mgkgram</h2> -->
        <h2 class="header-left_name" ><router-link to="/">Mgkgram</router-link></h2>
      </div>
      <input class="header-center" @change="search" type="text" v-model="params.follower_gteq" placeholder="フォロワー数で検索">
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
import serch from "./serch"
import Qs from 'qs'
export default{

data(){
  return{
    params:{
     follower_gteq:""
    }
  }
},
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
  },
  search(){

    // const q={
    //     follower_gteq:this.follower_gteq
    //   }
    this.params.follower_gteq=Number(this.params.follower_gteq);
    console.log(this.params.follower_gteq)
    axios
      .get('/api/v1/users/search.json',{params:{
        q:this.params
      },
       paramsSerializer: function(params) {
            return Qs.stringify(params, {arrayFormat: 'brackets'})
          }
      })
        .then((response) => {
          console.log(response);
        
        })
        .catch((error) => {
          console.log(error);
          this.notify(error.message);
        })

  }
},
components:{
 
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
       font-family:'Courier';
       letter-spacing:0;
      // font-weight: bold;
    }
    }
  &-center{
    font-size:1.2rem;
    color:rgba(var(--b6a, 219, 219, 219), 1);
    height: 28px;
    background: rgba(var(--b3f,250,250,250),1);
    border: 1px solid rgba(var(--b6a, 219, 219, 219), 1);
    border-radius: 2px;
  }
   &-right{
    display:inline-flex;   
    &_icon{
      margin-left:20px;
    }
}
}

</style>