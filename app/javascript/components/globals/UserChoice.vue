<template>
  <div class="user-choice">
    <ul class="user-choice-list">
      <li class="user-choice-list-row" @click="getFalse">
        <router-link :to="{ name: 'Profile', params: { id: currentUser.id } } ">
          <font-awesome-icon class="user-choice-list-row-left" icon="user-cog"></font-awesome-icon>
          <p class="user-choice-list-row-rigth">
            プロフィール
          </p>
        </router-link> 
      </li>
    </ul>
    <div class="user-choice-logout">
      <p @click="logout">ログアウト</p>
    </div>
  </div>
</template>

<script>

import firebase from 'firebase'
  export default {
    props:{
      currentUser:Object
    },
    data() {
      return {
      
      };
    },
    methods:{    //routerにメソッドかけても行かない！！
      getFalse(){
        this.$emit("getFalse")
      },
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
    }
   
     
  };
</script>

<style scoped lang="scss">
.user-choice{
  width:220px;
 
  border-radius: 5px;
  background:white;
  box-shadow: 0 0 5px rgba(var(--jb7,0,0,0),.0975);
  font-size:1.2rem;
  &-list{
    width:100%;
    border-bottom: 1px solid rgba(var(--b6a, 219, 219, 219), 1);
    &-row{
      height:40px;
      width:90%;
      margin:0 auto;
      a{
        height: 100%;
        display: flex;
        align-items: center;
        .user-choice-list-row-left{
          margin-right:10px;
        }
      }
    }
  }
  &-logout{
    width:90%;
    height:40px;
    margin:0 auto;
    p{
      line-height:40px;
    }
  }

}




</style>