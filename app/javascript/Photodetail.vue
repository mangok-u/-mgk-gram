<template>
  <div @click="isTrue" id="photo-detail">
    <div class="photo-detail">
      <div class="header">
        <div class="header-left">
          <p >run_goku</p>
        </div>
        <div class="header-right">
          <p @click="openModal">…</p>
        </div>
      </div>
      <div class="photo-detail-img">
        <img :src="post.image">
      </div>
      <div class="photo-detail-desc">
      </div>
    </div>
    <div v-show="isTouched" @click="closeModal" class="modal-wrapper">
      <div class="modal">
        <div class="modal-edit">  
           <!-- params入れたい時は名前付き</del> -->
          <router-link :to="{ name: 'PostsEdit', params: { id: post.id }}">Edit</router-link>
        </div>
        <div @click="deletePost()" class="modal-delete">
          <a>delete</a>
        </div>
        <div @click="closeModal" class="modal-cancel">
          <a>cancel</a>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import axios from 'axios';

export default {
 
  data: function () {
    return {
      post: {},
      isTouched:false
    }
  },
  mounted () {
    axios
      .get(`/api/v1/posts/${this.$route.params.post_id}.json`)
      .then(response => (this.post = response.data))
  },
  // beforeUpdate(){
  //    axios
  //     .get(`/api/v1/posts/${this.$route.params.post_id}.json`)
  //     .then(response => (this.post = response.data))
  // },
  methods:{
    deletePost(){
      console.log('hoge')
      axios
       .delete(`/api/v1/posts/${this.$route.params.post_id}`)
        .then(response => {
           this.$router.push({path: '/'});
           this.$emit('isFalse',false);
          // this.updatePosts();
        })
    },
    isTrue(){  //電波防ぐためにある
      this.$emit('isTrue',true)
    },
    openModal(){
      this.isTouched=true
    },
    closeModal(){
      this.isTouched=false
    }
  }
}
</script>

<style scoped lang="scss">


.photo-detail{
  width:90%;
  max-width:448px;
  margin:0 auto;
  padding-top:10px;
 
  .header{
    width:90%;
    display:flex;
    justify-content: space-between;
    padding:0 5%;
    font-size:1.4rem;
    margin-bottom:10px;
    font-weight:bold;
    &-left{
      
    }

  }

  &-img{
    width:100%;

    img{
      width:100%;
      height:auto;
      
      height: 500px;
      object-fit: cover;
    }
  }
}

.modal-wrapper{
  position:fixed;
  background:rgba(0,0,0,0.5);
  top:0;
  left:0;
  width:100%;
  height:100%;
  z-index:1;
  .modal{
    position: absolute;
    top: 50%;
    left:50%;
    transform: translate(-50%,-50%);
    z-index:100;
    background: white;
    height:200px;
    width:300px;
    border-radius:5px;
    div{
      height:calc(200px / 3);
      text-align: center;
      a{
        line-height: 66px;
        display:block;
        height:100%;
        width: 100%;
      }
    }
    &-edit{
      a{
       border-bottom: 1px solid rgba(var(--b6a,219,219,219),1);
      }
    }
    &-delete{
      a{
       border-bottom: 1px solid rgba(var(--b6a,219,219,219),1);
      }
    }
  }
}


</style>