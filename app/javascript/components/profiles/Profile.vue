<template>
  <div>
    <ProfileIndex  :user="user"></ProfileIndex>
    <ProfileHeader></ProfileHeader>
    <ProfilePhotos :user="user"></ProfilePhotos>
  </div>
</template>
<script>

import axios from 'axios';
import ProfileIndex from './ProfileIndex.vue' 
import ProfileHeader from './ProfileHeader.vue' 
import ProfilePhotos from './ProfilePhotos.vue' 
export default{
  props:{
    id:Number
  },
  data(){
    return{
      user:{
      } , //定義しないとprops先でunbdeife},  dataとpropsりょ方 いやpropsで定義されていればおけ！！！！！！！！
      
    }
  },
  components:{
    ProfileIndex,
    ProfileHeader,
    ProfilePhotos
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.id}.json`)
      .then(response => {
        this.user = response.data 
     
        // this.follower_info=response.data.follower_info
      })
   },
  //  beforeUpdate(){
  //    axios
  //     .get(`/api/v1/users/${this.id}.json`)
  //     .then(response => {
  //       this.user = response.data 
  //       console.log(response.data )
  //       // this.follower_info=response.data.follower_info
  //     })

  //  }
}
</script>