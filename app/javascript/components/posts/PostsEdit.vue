<template>
  <div class="posts-edit">
    <posts-form :errors="errors" :post="post" :id="id" @submittt="updatePost"></posts-form>
 </div>
</template>


<script>
import axios from 'axios';
import PostsForm from './PostsForm.vue'
export default {
  props:{
    id:Number
  },
  data: function () {
    return {
      post: {
      },
      errors: ''
    }
  },
   mounted () {
    axios
      .get(`/api/v1/posts/${this.$route.params.id}.json`)
      .then(response => (this.post = response.data))

  },//編集画面に表示さセルため
  methods: {
    updatePost: function() {
      axios
        .patch(`/api/v1/posts/${this.post.id}`, this.post)
        .then(response => {
          let e = response.data;
          this.$router.push({path: '/'});
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  },
  components:{
    PostsForm
  }
}
</script>

<style scoped lang="scss">

.posts-edit{
 padding-top:60px;
 background: rgba(var(--b3f, 250, 250, 250), 1);
 text-align:center;
}
</style>