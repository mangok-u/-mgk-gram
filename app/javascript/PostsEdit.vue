<template>
  <posts-form :errors="errors" :post="post" @submittt="updatePost"></posts-form>
</template>


<script>
import axios from 'axios';
import PostsForm from './PostsForm.vue'
export default {
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
      //patchな
        .patch(`/api/v1/posts/${this.post.id}`, this.post)
        .then(response => {
          let e = response.data;
          this.$router.push({ name: 'PostsDetail', params: { id: this.post.id } });
          //上記に遷移
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

<style scoped>
</style