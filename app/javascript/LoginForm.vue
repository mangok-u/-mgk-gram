<template>
    <div class="login-form">
        <div class="login-form-box">
          <h2 class="login-form-box-title">Mgkgram</h2>
          <div class="login-form-box-form">
            <form >   
              <div class="login-form-box-form-email">
                <input v-model="email" type="text">
              </div>
              <div class="login-form-box-form-password">
                <input v-model="password" type="password">
              </div>
              <div class="login-form-box-form-submit">
                <button @click="login" type="submit">ログイン</button>
              </div>
              <div class="login-form-box-form-another">
                <div></div>
                <p>または</p>
                <div></div>
              </div>
              <div class="login-form-box-form-facebook">
                <a href="#">Facebookでログイン</a>
              </div>
            </form>
          </div>
        </div>
        <div class="login-form-signup">
          <p>アカウントをお待ちでないですか？</p>
          <router-link to="/user/signup">登録する</router-link>
        </div>
      </div>
</template>

<script>
import firebase from 'firebase'
import axios from 'axios';

export default{

  data(){
    return{
      email:"",
      password:""
    }
  },
  created(){
    console.log('hoge')
    // let store=this.$store;
    // const authCheck = ({store, redirect }) => {
    firebase.auth().onAuthStateChanged(async user => {
        if (user) {
            const { data } = await axios.get(`api/v1/users?uid=${user.uid}`)
            console.log("ログインしているユーザー:", data)
            this.$store.commit("setUser", data)
            const userr=this.$store.state.currentUser;
            console.log(userr)
        } else {
            this.$store.commit("setUser", null)
        }
    });
  //  }
  //  authCheck();
  },
   methods: {
    login: function () {
      firebase.auth().signInWithEmailAndPassword(this.email, this.password)
      .then(
        // 成功時の処理
        alert('Success!')
      )
      .catch(
        // エラー時の処理 
      )
    }
  }

}
</script>


<style scoped lang="scss">
input{
  border: 1px solid rgba(var(--b6a,219,219,219),1);
  background:rgba(var(--b3f,250,250,250),1);
}
.login-form{
  width:100%;
  padding-top:60px;
  &-box{
    width:350px;
    border: 1px solid rgba(var(--b6a,219,219,219),1);
    background:white;
    margin:0 auto;
    margin-bottom:10px;
    padding-bottom:40px;
    display:flex;
    flex-direction:column;
    align-items:center;
    &-title{
      font-size:30px;
      padding-top:30px;
      margin-bottom:40px;
      font-family:'Tahoma';
    }
    &-form{
      width:80%;
      margin:0 auto;
      &-email{
        width:100%;
        margin-bottom:10px;
        input{
          width:100%;
          height:36px;
        }
      }
      &-password{
        width:100%;
        margin-bottom:16px;
        input{
          width:100%;
          height:36px;
        }
      }
      &-submit{
        button{
            border: 1px solid transparent;
            background-color: #0095f6;
            width:100%;
            height:32px;
            color:white;
            border-radius:3px;
            font-weight:bold;
        }
      }
      &-another{
        display:flex;
        height:40px;
        justify-content: space-between;
        margin-bottom:40px;
          div{
          width:100px;
          border-bottom:1px solid rgba(var(--b6a,219,219,219),1);
         }
         p{
           position:relative;
           top:30px;
           color: rgba(var(--f52,142,142,142),1);
           font-size:1.4rem;
         }
      }
      &-facebook{
        display:flex;
        justify-content: center;
        a{
          color: #385185;
          font-size:1.4rem;
          font-weight: bold;
        }
      }
    }
  }
  &-signup{
    display:flex;
    width:350px;
    height:60px;
    border: 1px solid rgba(var(--b6a,219,219,219),1);
    background:white;
    margin:0 auto;
    display:flex;
    align-items:center;
    justify-content: center;
    font-size:1.4rem;
    p{
      margin-right:5px
    }
    a{
      color: #0095f6;
      font-weight: bold;
    }
  }
}


</style>