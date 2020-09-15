<template>
  <div class="posts-new">
    <posts-form :errors="errors"  :post="post" @submittt="createPost"></posts-form>
    <Loading v-show="isLoading"></Loading>
  </div>
</template>

<script>
import axios from 'axios';
import PostsForm from './PostsForm.vue'
import Loading from '../parts/Loading.vue'


export default {
  data: function () {
    return {
      post: {
        name: '',
        text:'',
        image:'',
        user_id:this.$store.state.currentUser.id
      },
      errors: '',
      isLoading:false,
    }
  },

  mounted(){
  
    this.selectFile()
      
  },
  methods: {
    createPost: function() {
      this.isLoading=true
      console.log(this.isLoading)
      axios
        .post('/api/v1/posts', this.post)
        .then(response => {
          this.isLoading=false;
          let e = response.data;
          this.$router.push({path: '/'});
          //上記に遷移
        })
        .catch(error => {
          this.isLoading=false;
          console.log(this.$store.state.currentUser)
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    selectFile(){
        var a = document.getElementById("select-file");
        a.click();
      }
  },
  components:{
    PostsForm,
    Loading
  }
}
</script>

<style scoped lang="scss">
.posts-new{
 padding-top:60px;
 background: rgba(var(--b3f, 250, 250, 250), 1);
 text-align:center;
}


</style>