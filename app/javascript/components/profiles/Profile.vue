<template>
  <div>
    <ProfileIndex :user="user"></ProfileIndex>
    <ProfileHeader></ProfileHeader>
    <ProfilePhotos></ProfilePhotos>
  </div>
</template>
<script>

import axios from 'axios';
import ProfileIndex from './ProfileIndex.vue' 
import ProfileHeader from './ProfileHeader.vue' 
import ProfilePhotos from './ProfilePhotos.vue' 
export default{
  data(){
    return{
      user:{}
    }
  },
  components:{
    ProfileIndex,
    ProfileHeader,
    ProfilePhotos
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$store.state.currentUser.id}.json`)
      .then(response => (this.user = response.data))
   }
}
</script>