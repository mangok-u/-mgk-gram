<template>
<div>
  <dl>
    <dt>ID</dt>
    <dd>{{ post.id }}</dd>
    <dt>Name</dt>
    <dd>{{ post.name }}</dd>
  </dl>
  <!-- <button@click="deletePost">kk</button@click=> -->
</div>
</template>

<script>
import axios from 'axios';

export default {
  
  data: function () {
    return {
      post: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/posts/${this.$route.params.id}.json`)
      .then(response => (this.post = response.data))
  },
  methods:{
    deletePost(){
      axios
       .delete(`/api/v1/posts/${this.$route.params.id}`)
        .then(response => {
           this.$router.push({path: '/'});
          // this.updatePosts();
        })
    },
    //  updatePosts: function() {
    //   axios
    //     .get(`/api/v1/posts/${this.$route.params.id}.json`)
    //     .then(response => (this.post = response.data))
    // }
  }
}
</script>

<style scoped>
</style>