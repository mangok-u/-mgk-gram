<template>
<div class="post">
  <posts-form :errors="errors"  :post="post" @submittt="createPost"></posts-form>
</div>
</template>

<script>
import axios from 'axios';
import PostsForm from './PostsForm.vue'
export default {
  data: function () {
    return {
      post: {
        name: '',
        text:'',
        image:''
      },
    
      errors: ''
    }
  },
  methods: {
    createPost: function() {
      axios
        .post('/api/v1/posts', this.post)
        .then(response => {
          let e = response.data;
          this.$router.push({path: '/'});
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
.post{
 padding-top:60px;
}
</style>