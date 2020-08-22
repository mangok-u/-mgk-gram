<template>
  <div id="post-index">
    ddddddddddd
  </div>
</template>

<script>
import axios from 'axios';

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
 
}
</script>

<style scoped lang="scss">
.posts-new{
 padding-top:60px;
 background: rgba(var(--b3f, 250, 250, 250), 1);
 text-align:center;
}
</style>
