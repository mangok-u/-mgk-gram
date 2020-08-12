<template>
  <div id="profile-photos">
    <div class="profile-photos">
      <div class="photo-box" v-for="post in posts" :key="post.id">
         <router-link  :to="{ name: 'Photodetail', params: { id: post.id } }"><img @click="openDetail" :src="post.image" ></router-link>
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
  data(){
    return{
      posts:[],
      isTouched:false
    }
  },
  mounted(){
    axios
      .get('/api/v1/posts.json')
      .then(response => (this.posts = response.data))
      //jsonをデーター型に合わせるのが鍵
  },
  beforeUpdate(){
    axios
      .get('/api/v1/posts.json')
      .then(response => (this.posts = response.data))
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
  /* background:white; */
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
  justify-content: space-between;
  margin:0 auto;
  position:static;
    z-index:6;
  .photo-box{
    width:33%;
    margin-bottom:0.5%;
    position:relative;
  
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