<template>
  <div class="posts-detail">
    <div class="posts-detail-header">
      <div class="posts-detail-header-left">
        <p>
          <img v-if="user.image!=null" class="posts-detail-header-left-icon" :src="user.image">
          <img v-else class="posts-detail-header-left-icon" src="/images/damy.jpg">
        </p> 
        <p class="posts-detail-header-left-name">
          <router-link :to="{ name: 'Profile', params: { id: user.id } } ">
            {{user.user_name}}
          </router-link>
        </p>
      </div>
      <div class="posts-detail-header-right">
        •••
      </div>
    </div>
    <div class="posts-detail-image">
      <img :src="post.image">
    </div>
    <div class="posts-detail-action">
      <div class="posts-detail-action-left">
        <button @click="like">
          <font-awesome-icon :class="{liked: isLiked}"  icon="heart" disabled></font-awesome-icon>
        </button>
        <p>$</p>
        <p>$</p>
      </div>
      <div class="posts-detail-action-right">
        <p>$</p>
      </div>
    </div>
    <div v-if="post.like_number>0" class="posts-detail-like">
      <p>{{post.like_number}}人がいいねしました</p>
    </div>
    <div class="posts-detail-text">
      <div class="posts-detail-text-box">
        <!-- <p class="posts-detail-text-box-user"> -->
        <router-link :to="{ name: 'Profile', params: { id: user.id } } ">
          {{user.user_name}}
        </router-link>
        <!-- </p> -->
        <p class="posts-detail-text-box-text">
          {{firstText}}
        </p>
        <p class="posts-detail-text-box-next" v-if="isArray" @click="showNext">続きを読む</p>
      </div>
      <template v-if="isNext">
        <p class="posts-detail-text-box-all"  v-for="(text,index) in restText" :key="index">
          {{text}}
        </p>
      </template>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
   
   props:{
     id:Number
   },
   data(){
     return{
       post:{
         text:'',
         likes:[]
         },   //オプションで使う値はすべて先に定義
       user:{},
       isArray:false,
       isNext:false,
       isLiked:false,
       currentUser:this.$store.state.currentUser
     }
   },
  mounted() {
    axios
      .get(`/api/v1/posts/${this.id}.json`)
      .then(response => {
        this.post = response.data
        this.user = this.post.user
      })
    
  },
  beforeUpdate(){   //mountedと一緒にしていると、空のtextに
    this.checkArray
    this.checkLiked();
  },
  computed:{
    firstText(){
      let textArray= this.post.text.split(/\r\n|\r|\n/);
      return textArray[0];
    },
    restText(){
      let textArray= this.post.text.split(/\r\n|\r|\n/); //shift使うと返り血が消えた値になる
      let restArray=textArray.filter((item, index) => index !== 0);
      return restArray;
    },
    checkArray(){
       let textArray= this.post.text.split(/\r\n|\r|\n/);
       if(textArray.length>1){
        this.isArray=true;
       }
    }
    
  },
  methods:{
    
    // makeTextArray(){
    //    let textArray= this.post.text.split(/\r\n|\r|\n/);
    //    return textArray;
    // },
    like(e){
      e.target.setAttribute("disabled", "disabled")
      const like = {
                  post_id: this.post.id,
                  user_id: this.currentUser.id,
                };
        if(this.isLiked==false){
        axios
          .post(`/api/v1/likes`,{like})
          .then(response => {
            e.target.removeAttribute("disabled")
            console.log('like')
            this.isLiked=true;
            this.post.like_number+=1;
  
          })
          .catch(error => {
             e.target.removAttribute("disabled")
            console.error(error);
            if (error.response.data && error.response.data.errors) {
              this.errors = error.response.data.errors;
            }
          });
        }else{
          axios
          .delete(`/api/v1/likes/${like.post_id}`,{data: like})
          .then(response => {
            e.target.removeAttribute("disabled")
            console.log('unlike')
            this.isLiked=false;
            this.post.like_number-=1;
             console.log(this.isLiked)

          })
          .catch(error => {
             e.target.removeAttribute("disabled")
            console.error(error);
            if (error.response.data && error.response.data.errors) {
              this.errors = error.response.data.errors;
            }
          });

        }
    },
    checkLiked(){

      let userArray=this.post.likes.map((user)=>user.user_id);
        if(userArray.includes(this.currentUser.id)){
          this.isLiked=true;   
          console.log(this.isLiked);
        }
    },
   
    showNext(event){
      this.isNext=true;
      event.target.remove();
    },
    
    

  }
}
</script>

<style scoped lang="scss">

  .liked{
   color:tomato;
  }
  .posts-detail{
    width:100%;
    border: 1px solid rgba(var(--b6a,219,219,219),1);
    margin-bottom:50px;
    padding-bottom:20px;
    background:white;
    &-header{
      width:95%;
      height:50px;
      margin:0 auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
      &-left{
        display:flex;
        width:80%;
        &-icon{
          width:32px;
          height:32px;
          margin-right:10px;
          object-fit: cover;
          border-radius: 50%;
        }
        &-name{
          font-size:1.4rem;
          font-weight: bold;
        }
      }
      &-right{
        width:20%;
        text-align: right;
      }
    }
    &-image{
      width:100%;
      img{
        width:100%;
        height:550px;
        object-fit: cover;
      }
    }
    &-action{
      width:95%;
      height:40px;
      margin:0 auto;
      display:flex;
      justify-content: space-between;
      align-items:center;
      &-left{
        width:60%;
        display:flex;
        button{
        background:white;
        border:none;
        padding:0;
        font-size:1.6rem;
        margin-right:15px;
      }
        p{
          margin-right:15px;
          font-size:1.6rem
        }
      }
      &-right{
        width:40%;
        text-align:right;
        p{
          font-size:1.6rem
        }
      }
    }
    &-like{
      width:95%;
      height:30px;
      margin:0 auto;
      line-height:30px;
    }
    &-text{
      width:95%;
      margin:0 auto;
      &-box{
        display:flex;
        a{
          font-weight: bold;
          margin-right:5px
        }
        &-text{
          margin-right:5px
        }
        &-next{
          color: rgba(var(--f52,142,142,142),1);
          margin-right:5px
        }
        
      }
    }
  }
</style>