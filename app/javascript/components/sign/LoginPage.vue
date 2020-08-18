<template>
  <div id="login-page">
    <!-- <router-view name="login"></router-view> -->
     <router-view name="login"></router-view>
    <!-- <LoginForm></LoginForm> -->
    
  </div>
</template>

<script>
import LoginForm from "./LoginForm.vue"
export default{
  components:{
    LoginForm,
  }
}
</script>


<style scoped lang="scss">
#login-page{
  height:100vh;
   background:rgba(var(--b3f,250,250,250),1);
}
input{
  border: 1px solid rgba(var(--b6a,219,219,219),1);
  background:rgba(var(--b3f,250,250,250),1);
}
.login-page{
  width:100%;
  padding-top:60px;
  &-box{
    height:400px;
    width:350px;
    border: 1px solid rgba(var(--b6a,219,219,219),1);
    background:white;
    margin:0 auto;
    margin-bottom:10px;
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