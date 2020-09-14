<template>
    <div class="login-form">
        <div class="login-form-box">
          <h2 class="login-form-box-title">Mgkgram</h2>
           <div class="form-error" v-if="errors.length != 0">
            <ul v-for="e in errors" :key="e">
              <li><font color="red">{{ e }}</font></li>
            </ul>
          </div>
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
        <Loading v-show="isLoading"></Loading>
      </div>
</template>

<script>
import firebase from 'firebase'
import axios from 'axios';
import Loading from '../../Loading.vue'

export default{

  data(){
    return{
      email:"",
      password:"",
      errors:[],
      isLoading:false,
    }
  },
  components:{
     Loading
  },
   methods: {
    login: function () {
       this.isLoading=true
       this.errors=[]
      firebase
        .auth()
        .signInWithEmailAndPassword(this.email, this.password)
        .then(()=>{
             this.isLoading=false
             this.$router.push("/");
        })
         .catch(err=>{
            this.isLoading=false
            alert('ログイン失敗')
            console.log(err)
            this.errors.push(err)
             console.log(this.errors)
        })
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
       xz1font-family:'Courier';
      letter-spacing: 1;
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