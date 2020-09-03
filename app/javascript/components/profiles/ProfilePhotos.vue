<template>
  <div  id="profile-photos">
    <div class="profile-photos">
      <div class="photo-box" v-for="post in user.posts" :key="post.id">
         <router-link  :to="{ name: 'Photodetail', params: { post_id: post.id } }">
           <img @click="openDetail" :src="post.image" >
          </router-link>
      </div>  
    </div>
    <div @click.self="closeDetail" v-show="isTouched" id="wrapper-mask">
      <router-view  @isTrue="isTrue" @isFalse="isFalse" id="photo-detail" name="profile"></router-view>
    </div>
  </div>  
</template>
<script>
import axios from 'axios';
export default{

   props:{
     user:{
       posts:Array,
       id:Number
     }
   },
  data(){
    return{

      isTouched:false
    }
  },
  methods:{
   
    openDetail(){
      console.log('hoge')
       this.isTouched=true;
    },
    closeDetail(){
      if(this.isTouched=true){
       this.isTouched=false;
      }
    },
    isTrue(value){  //emitで電場を防ぐ！！！！
      this.isTouched=value;
    },
    isFalse(){
      this.closeDetail()
    }
  }
}

</script>

<style scoped lang="scss">


  .get-opacity{
    opacity:0.5
  }
  #profile-photos{
    width:100%;
    
  }
  #wrapper-mask{
    position:fixed;
    background:rgba(0,0,0,0.5);
    
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:9;
  }

  #photo-detail{
    width:80%;
    margin:0 auto;
    position: absolute;
    top: 50%;
    left:50%;
    transform: translate(-50%,-50%);
    z-index:100;
    background: white;
    height:600px;
  }
  .profile-photos{
    width:90%;
    max-width:970px;
    display:flex;
    flex-wrap:wrap;
    justify-content: start;
    margin:0 auto;
    position:static;
    z-index:6;
    .photo-box{
      width:33%;
      margin-bottom:0.5%;
      position:relative;
      &:not(:nth-child(3n)){
        margin-right:0.5%;
      }
      &:before{
      content: "";
      display: block;
      padding-top: 100%;
      }
      img{
        width:100%;
        height:100%;
        position: absolute;
        top:0;
        object-fit: cover;
        z-index:2;  //wrapperよりで額しないとクリックできない
      }
    }
  }




</style>