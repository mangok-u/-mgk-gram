<template>
  <div id="profile-index">
    <div class="profile-index">
      <div class="img-area">
        <div class="img-area-box">
          <img  v-if="user.image==null" class="img-area-box-img" src="/images/damy.jpg">
          <img  v-else class="img-area-box-img" :src="user.image">
        </div>
        <form @submit.prevent="updateIcon">
          <input  name="uploadedImage" type="file" accept="image/*" ref="file"  v-on:change="onFileChange()" id="select-file">
          <button v-if="isTouched" type="submit">Commit</button>
        </form>
      </div>
      <div class="detail-area">
        <div class="detail-area-name">
          <p class="detail-area-name-user" >{{user.full_name}}</p>
          <button v-if="user.id==currentUser.id" @click="selectFile">プロフィールを編集</button>
          <template v-else>
            <button v-if="isFollow" @click="unFollow">follow解除</button>
            <button v-else @click="follow">follow</button>
            <p class="detail-area-name-follow" v-if="isGetFollow">あなたをフォローしています</p>
          </template>
          
          <!-- <a href="#">$</a> -->
        </div>
        <div class="detail-area-number">
          <p >投稿{{user.posts.length}}</p>
          <p >フォロワー{{showNum(user.follower)}}人</p>
          <p>フォロー中{{showNum(user.following)}}人</p>
        </div>
        <div class="detail-area-intro">
          <p class="detail-area-intro-name">{{user.user_name}}</p>
          <p class="detail-area-intro-text">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
            ed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
            ed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default{

// 型定義しておかんとlength使えない
  props:{
    user:{
     full_name:String,
     user_name:String,
     follower:Number,
     following:Number,
     posts:Array,
     following_info:Array, //むしろ中のkeyは必要ない！！！！１
     follower_info:Array
    },
  },
  data(){
    return{
      uploadedImage:'',
      isTouched:false,
      isFollow:false,
      isGetFollow:false,
      currentUser:this.$store.state.currentUser
    }
  },
  beforeUpdate(){
    this.followingCheck();
    this.getFollowedCheck()
  },
  methods: {
   follow() {
     const follow = {
                  following_id: this.currentUser.id,
                  follower_id: this.user.id,
                };
        axios
          .post(`/api/v1/follows`, {follow})
          .then(response => {
            console.log('follow')
            this.user.follower_info=response.data
            this.user.follower+=1;
            this.isFollow=true;
          })
          .catch(error => {
            console.error(error);
            if (error.response.data && error.response.data.errors) {
              this.errors = error.response.data.errors;
            }
          });
    },
    unFollow(){
      const follow = {
                  following_id: this.currentUser.id,
                  follower_id: this.user.id,
                };
        axios
          .delete(`/api/v1/follows/${follow.following_id}`,{data: follow})
          .then(response => {
            console.log('unfollow')
            this.user.follower_info=response.data
            this.user.follower-=1;
            this.isFollow=false;
          })
          .catch(error => {
            console.error(error);
            if (error.response.data && error.response.data.errors) {
              this.errors = error.response.data.errors;
            }
          });
    },
    followingCheck(){//currentがfollowしている
      //profileに紐付けfollowテーブルのfollowしている人をcheck!  follower_idは被フォロー
       let followArray=this.user.follower_info.map((follower)=>follower.following_id);
        if(followArray.includes(this.currentUser.id)){
          this.isFollow=true;
        }
    },
    getFollowedCheck(){//currentがfollowされているか
      //profileに紐付けfollowテーブルのfollowしている人をcheck!  follower_idは被フォロー
       let followerArray=this.user.following_info.map((follow)=>follow.follower_id);
        if(followerArray.includes(this.currentUser.id)){
          this.isGetFollow=true;
        }
    },
    updateIcon() {
      axios
        .patch(`/api/v1/users/${this.user.id}/icon_update`, this.user)
        .then(response => {
          let e = response.data;
          this.isTouched=false;
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
      onFileChange() {
        let file = event.target.files[0] || event.dataTransfer.files
        let reader = new FileReader()

          reader.onload = () => {
            
              this.uploadedImage = event.target.result
              this.user.image = this.uploadedImage
            }
          reader.readAsDataURL(file)
          },
      selectFile(){
        var a = document.getElementById("select-file");
        a.click();
        this.isTouched=true;
      
      },
       showNum(val){
        // let pattern=/\d{5,}/
        let finalVal=""
        let reduceIndex=4  //forの中に入れて置かないと、繰り返し時にリセット
        let dotIndex=3

        if(val>=10000){
          for(let i=7; i>4; i--){
           
            let reg=new RegExp(`\\d{${i},}`)   //regらないと変数使えない
          
              if (reg.test(val)){
                let reduceNum=Math.round(val/1000)*1000 //どの部分を基準にするか
                let newVal=String(reduceNum).slice(0,reduceIndex); //oから何個ぶん撮りたいか
                finalVal=newVal.slice(0,dotIndex)+ '.' +newVal.slice(dotIndex) //0から何個めに入れたい？
              
              }else{
                reduceIndex-=1
                dotIndex-=1
                //elseに入れないと一致しなかった場合読まれない
              
              }
          }
         return finalVal+'万'

        }else{
          return String(val)
        }
       
        // if (val>=10000){
        //   let reduceNum=Math.round(val * 100)/10
        //   let newVal=String(reduceNum).slice(0,2);
        //   let finalVal=newVal.slice(0,1)+ '.' +newVal.slice(1)
        //   return finalVal+'万'
        // }
      }
    },
  
  }




</script>
<style scoped lang="scss">

#select-file{
         display: none;
       }

#profile-index{
  padding-top:60px;
  width:100%;
  height:450px;
  background:rgba(var(--b3f,250,250,250),1);
}

.profile-index{
  padding:30px 0 60px 0;
   width:80%;
   max-width:870px;
   margin:0 auto;
   height:100%;
   display: flex;
   .img-area{
     width:40%;
     position:relative;
    &-box{
      width:200px;
      height:200px;
      margin:0 auto;
      text-align: center;
      &-img{
      width:150px;
      height:150px;
      border-radius: 50%;
      object-fit: cover;
      }
    }
    button{
      position:absolute;
      bottom:100px;
      right:0;
      left:0;
      margin:0 auto;
    }
   }
   .detail-area{
     width:60%;
     &-name{
       display:flex;
       align-items: center;
       margin-bottom:30px;
       &-user{
         font-size:2.5rem;
         margin-right:20px;
       }
        button{
          border: 1px solid transparent;
          background-color: #0095f6;
          width:100px;
          margin-right:20px;
          height:26px;
          color:white;
          border-radius:3px;
          font-weight:bold;
          }
       a{
         font-size:1.6rem;
       }
       &-follow{
         font-size:1.2rem;
         color: rgba(var(--f52,142,142,142),1);
       }
     }
     &-number{
       display:flex;
       margin-bottom:30px;
       font-size:1.6rem;
       p{
         margin-right:40px;
       }
     }
     &-intro{
       &-name{
         font-size:1.6rem;
         font-weight: bold;
       }
       &-text{
         font-size:1.2rem;
          white-space: pre-line;
       }
     }
   }
}
</style>