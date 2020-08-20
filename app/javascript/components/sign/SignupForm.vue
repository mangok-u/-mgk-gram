<template>
    <div class="signup-form">
        <div class="signup-form-box">
          <h2 class="signup-form-box-title">Mgkgram</h2>
          <p class="signup-form-box-desc">
            登録してMGKの写真や動画をチェックしよう
          </p>
          <div class="signup-form-box-form">
            <form >
              <div class="signup-form-box-form-facebook">
                <a href="#">Facebookでログイン</a>
              </div> 
              <div class="signup-form-box-form-another">
                <div></div>
                <p>または</p>
                <div></div>
              </div>  
              <div class="signup-form-box-form-email">
                <input type="email" v-model="email" placeholder="携帯電話番号またはメールアドレス" >
              </div>
              <div class="signup-form-box-form-fullname">
                <input type="text" v-model="fullname" placeholder="フルネーム" >
              </div>
              <div class="signup-form-box-form-username">
                <input type="text" v-model="username" placeholder="ユーザーネーム" >
              </div>
              <div class="signup-form-box-form-password">
                <input type="password" v-model="password" placeholder="パスワード" >
              </div>
              <div class="signup-form-box-form-submit">
                <button @click="submit" type="submit">登録する</button>
              </div>
            </form>
          </div>
        </div>
        <div class="signup-form-login">
          <p>アカウントをお待ちですか？</p>
          <router-link to="/user/login">ログインする</router-link>
        </div>
      </div>
</template>

<script>
import firebase from 'firebase'
//この記述！！！！
import axios from 'axios';
export default{
  data(){
    return{
        email:"",
        fullname:"",
        username:"",
        password:""
    }
  },
  methods:{
    submit: function() {
       firebase
        .auth()
          .createUserWithEmailAndPassword(this.email, this.password)
           .then(res => {
            const user = {
                  email: res.user.email,
                  full_name: this.fullname,
                  user_name:this.username,
                  uid: res.user.uid,
                  password: this.password
                };
                axios.post("/api/v1/users",{ user }).then(() => {
                this.$router.push({path: '/'});
                });
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
.signup-form{
  width:100%;
  padding-top:30px;
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
      font-family:'Courier';
    }
    &-desc{
      margin-bottom:20px;
      font-size:1.6rem;
      color: rgba(var(--f52,142,142,142),1);
      width:80%;
      text-align:center;
      font-weight:bold;
    }
    &-form{
      width:80%;
      margin:0 auto;
      &-facebook{
        display:flex;
        justify-content: center;
        a{
          color: #385185;
          font-size:1.4rem;
          font-weight: bold;
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
      &-email{
        width:100%;
        margin-bottom:10px;
        input{
          width:100%;
          height:36px;
        }
      }
      &-fullname{
        width:100%;
        margin-bottom:10px;
        input{
          width:100%;
          height:36px;
        }
      }
      &-username{
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
      
      
    }
  }
  &-login{
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