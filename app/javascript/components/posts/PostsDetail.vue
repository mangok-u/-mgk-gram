<template>
  <div class="posts-detail">
    <div class="posts-detail-header">
      <div class="posts-detail-header-left">
        <div class="posts-detail-header-left-icon_box">
          <img v-if="user.image!=null" class="posts-detail-header-left-icon_box-icon" :src="user.image" @load="iconLoaded">
          <div class="posts-detail-header-left-icon_box-loading" v-else-if="isIconLoading">
            <LoadingMin></LoadingMin>
          </div>
          <img v-else class="posts-detail-header-left-icon_box-icon" :src="damyIcon" @load="iconLoaded">
          
        </div> 
        <p class="posts-detail-header-left-name">
          <router-link :to="{ name: 'Profile', params: { id: user.id } } ">
            {{user.user_name}}
          </router-link>
        </p>
      </div>
      <div class="posts-detail-header-right">
      
      </div>
    </div>
    <div class="posts-detail-image">
      <template name="fade">
        <img :src="post.image" @load="imageLoaded" v-show="!isImgLoading">
      </template>
      <div class="posts-detail-image-loading" v-show="isImgLoading">
        <LoadingMin></LoadingMin>
      </div>
    </div>
    <div class="posts-detail-action">
      <div class="posts-detail-action-left">
        <button @click="like">
          <font-awesome-icon :class="{liked: isLiked}"  icon="heart" disabled></font-awesome-icon>
        </button>
      </div>
      <div class="posts-detail-action-right">
       
      </div>
    </div>
    <div v-if="post.like_number>0" class="posts-detail-like">
      <p>{{post.like_number}}人がいいねしました</p>
    </div>
    <div class="posts-detail-text">
      <div class="posts-detail-text-box">
        <router-link :to="{ name: 'Profile', params: { id: user.id } } ">
          {{user.user_name}}
        </router-link>
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
import LoadingMin from '../../LoadingMin.vue'

export default {
   
   props:{
     id:Number
   },
   data(){
     return{
       post:{
         text:'',
         likes:[
         ]
         },   //オプションで使う値はすべて先に定義
       user:{},
       isArray:false,
       isNext:false,
       isLiked:false,
       isImgLoading:true,
       isIconLoading:true,
       currentUser:this.$store.state.currentUser,
       damyIcon:'/images/damy.jpg'
     }
   },
   created(){
     
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
            // const like=response.data
            // this.post.likes.push(like);
            this.post.likes=response.data
            this.isLiked=true;
            this.post.like_number+=1;
            console.log(this.post.likes)
  
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
            // const unLike=response.data
            console.log('unLike')
            // this.post.likes=this.post.likes.filter(like => like.id !== unLike.id) 
            //kore!!!配列！！！！！！！！！！！！！！！！！！！！！！！！！！
            this.post.likes=response.data    //結局dataをレスポンスで上書き
            this.isLiked=false;
            this.post.like_number-=1;
             console.log(this.isLiked)
              console.log(this.post.likes)

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
       console.log(this.post.likes)
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
    imageLoaded(){
      this.isImgLoading=false;
    },
    iconLoaded(){
      this.isIconLoading=false;
    },
    loaded(value){
      this.value=false;
    }
    
    

  },
  components:{
    LoadingMin
  }
}
</script>

<style scoped lang="scss">

  .liked{
   color:tomato;
  }
  // #posts-detail{
 
  .posts-detail{
    width:100%;
    border: 1px solid rgba(var(--b6a,219,219,219),1);
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
        width:80%;
        display:flex;
        align-items: center;
        &-icon_box{
          margin-right:10px;
          position: relative;
        
          &-icon{
            width:32px;
            height:32px;
            margin-right:10px;
            object-fit: cover;
            border-radius: 50%;
          }
          &-loading{
            position:absolute;
            top:50%;
            left:50%;
            transform: translateY(-50%) translateX(-50%);
          }
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
      position: relative;
      img{
        width:100%;
        height:550px;
        object-fit: cover;
      }
      &-loading{
        position:absolute;
        top:50%;
        left:50%;
        transform: translateY(-50%) translateX(-50%);
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

.fade-enter-active {
  transition: opacity 4s ease-in-out;
}

.fade-enter-to {
  opacity: 1;
}

.fade-enter {
  opacity: 0;
}
</style>