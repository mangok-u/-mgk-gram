<template>
  <div id="header">
    <div class="header">
      <div class="header-left">
        <!-- <h2 class="header-left_name">Mgkgram</h2> -->
        <h2 class="header-left_name" ><router-link to="/">Mgkgram</router-link></h2>
      </div>
      <div class="header-center">
        <input class="search-input" @input="search" type="text" v-model="params.follower_gteq" placeholder="フォロワー数で検索">
          <div id="search-result" v-if="isSearched" >
            <SearchResult :users="users"></SearchResult>
          </div>
          <div class="search-wrapper" v-if="isSearched" @click="removeResult"></div> 
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
import SearchResult from "./SearchResult"
import Qs from 'qs'
export default{

data(){
  return{
    params:{
     follower_gteq:"",
    },
    users:[],
    isSearched:false
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
          this.isSearched=true;
          this.users=response.data

        })
        .catch((error) => {
          console.log(error);
          this.notify(error.message);
        })

  },
  removeResult(){
    this.isSearched=false
  }
},
components:{
 SearchResult
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
  // position: relative;
  &-left{
    width:30%;
    &_name{
      font-size:2rem;
       font-family:'Courier';
       letter-spacing:0;
      // font-weight: bold;
    }
    }
    &-center{
        position:relative;
      .search-input{
        width:200px;
        font-size:1.2rem;
        color:rgba(var(--b6a, 219, 219, 219), 1);
        height: 28px;
        background: rgba(var(--b3f,250,250,250),1);
        border: 1px solid rgba(var(--b6a, 219, 219, 219), 1);
        border-radius: 2px;
      }
      #search-result{
        position:absolute;
        top:40px;
        left:-25px;
        width:250px;

        z-index:10;
      }
      .search-wrapper{
        position:fixed;
        width:100%;
        height:100%;
        top:0;
        left:0;
        z-index:0
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