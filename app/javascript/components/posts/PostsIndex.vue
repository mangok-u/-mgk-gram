<template>
  <div id="posts-index">
    <div class="posts-index">
      <div class="posts-index-area">
        <div class="posts-index-area-box" v-for="post in posts" :key="post.id">
          <PostsDetail :id="post.id"></PostsDetail>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import PostsDetail from './PostsDetail.vue'

export default {
  data: function () {
    return {
      posts: []
    }
  },
  mounted(){
    axios
      .get('/api/v1/posts.json')
      .then(response => (this.posts = response.data))
  },
  components:{
    PostsDetail
  }
 
}
</script>

<style scoped lang="scss">
#posts-index{
 padding-top:60px;
 background: rgba(var(--b3f, 250, 250, 250), 1);
 text-align:center;
 height:100vh;
}
.posts-index{
  padding-top:40px;
}
</style>
