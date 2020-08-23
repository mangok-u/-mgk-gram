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
          <p>{{user.full_name}}</p>
          <button v-if="user.id==currentUser.id" @click="selectFile">プロフィールを編集</button>
          <a href="#">$</a>
        </div>
        <div class="detail-area-number">
          <p>投稿{{user.posts.length}}</p>
          <p >フォロワー330人</p>
          <p>フォロー中314人</p>
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
     posts:Array
    }
  },
  data(){
  // const postsLength=this.user.posts.length;
    return{
      uploadedImage:'',
      isTouched:false,
      currentUser:this.$store.state.currentUser
    }
  },
 methods: {
    updateIcon() {
      axios
        .patch(`/api/v1/users/${this.user.id}/icon_update`, this.user)
        .then(response => {
          let e = response.data;
          this.isTouched=false;
          // this.imgSrc=e.image
          // this.$router.push({path: '/'});
          //上記に遷移
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
        // this.imgSrc=URL.createObjectURL(file);
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
      
      }
    }
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
       p{
         font-size:2.5rem;
         margin-right:20px;
       }
       button{
         margin-right:20px;
         background:white;
         border:solid 1px #8e8e8e;
         border-radius: 4px;
         padding:2px 4px;
         font-weight: bold;
       }
       a{
         font-size:1.6rem;
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