<template>
  <div class="posts-detail">
    <div class="posts-detail-header">
      <div class="posts-detail-header-left">
        <p>
          <img v-if="post.image!=null" class="posts-detail-header-left-icon" :src="post.image">
          <img v-else class="posts-detail-header-left-icon" src="/images/damy.jpg">
        </p> 
        <p class="posts-detail-header-left-name">
          {{user.user_name}}
        </p>
      </div>
      <div class="posts-detail-header-right">
        •••
      </div>

    </div>
    <div class="posts-detail-image">

    </div>
    <div class="posts-detail-action">

    </div>
    <div class="posts-detail-text">

    </div>
    <div class="posts-detail-comment">

    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
   
   props:{
     id:Number
   },
   data(){
     return{
       post:{},
       user:{}
     }
   },
  mounted() {
    axios
      .get(`/api/v1/posts/${this.id}.json`)
      .then(response => {
        this.post = response.data
        this.user = this.post.user
      })
  },
  methods:{
    // deletePost(){
    //   axios
    //    .delete(`/api/v1/posts/${this.$route.params.id}`)
    //     .then(response => {
    //        this.$router.push({path: '/'});
    //       // this.updatePosts();
    //     })
    // },
    //  updatePosts: function() {
    //   axios
    //     .get(`/api/v1/posts/${this.$route.params.id}.json`)
    //     .then(response => (this.post = response.data))
    // }
  }
}
</script>

<style scoped lang="scss">
  .posts-detail{
    width:100%;
    height:500px;
    border: 1px solid rgba(var(--b6a,219,219,219),1);
    margin-bottom:50px;
    background:white;
    &-header{
      width:95%;
      height:50px;
      margin:0 auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
      &-left{
        display:flex;
        width:80%;
        &-icon{
          width:32px;
          height:32px;
          margin-right:10px;
          object-fit: cover;
          border-radius: 50%;
        }
        &-name{
          font-size:1.4rem;
          font-weight: bold;
        }
      }
      &-right{
        width:20%;
        text-align: right;
      }
    }
  }
</style>