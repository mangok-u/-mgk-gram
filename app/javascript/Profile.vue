<template>
  <div>
    <ProfileIndex></ProfileIndex>
    <ProfileHeader></ProfileHeader>
    <ProfilePhotos></ProfilePhotos>
  </div>
</template>
<script>


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
  // mounted () {
  //   axios
  //     .get(`/`)
  //     .then(response => (this.user = response.data))
  //  }
}
</script>