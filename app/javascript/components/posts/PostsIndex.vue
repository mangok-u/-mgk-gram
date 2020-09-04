<template>
  <div id="posts-index">
    <div class="posts-index">
      <div class="posts-index-area">
        <div class="posts-index-area-box" v-for="post in posts" :key="post.id">
          <PostsDetail class ="ddd" :id="post.id"></PostsDetail>
        </div>
      </div>
    </div>
    <Loading v-show="isLoading"></Loading>
  </div>
</template>

<script>
import axios from 'axios';
import PostsDetail from './PostsDetail.vue'
import Loading from '../../Loading.vue'

export default {
  data: function () {
    return {
      posts: [],
      isLoading:true
    }
  },
  mounted(){
    axios
      .get('/api/v1/posts.json')
      .then(response => {
        this.posts = response.data
        this.isLoading=false
      })
  },
  updated(){

  },
  components:{
    PostsDetail,
    Loading
  }
 
}
</script>

<style scoped lang="scss">
#posts-index{
 padding-top:60px;
 background: rgba(var(--b3f, 250, 250, 250), 1);
 
}
.posts-index{
  padding-top:40px;
  &-area{
    width:80%;
    max-width:600px;
    margin:0 auto;
    &-box{
      width:100%;
      &:not(:last-child){
        margin-bottom:50px;
      }
    }
  }
}


</style>
