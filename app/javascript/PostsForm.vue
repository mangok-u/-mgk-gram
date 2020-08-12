<template>
  <form @submit.prevent="$emit('submittt')">   
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>Name</label>
      <input v-model="post.name" type="text">
    </div>
    <div>
      <label>Text</label>
      <input v-model="post.text" type="text">
    </div>
     <input name="uploadedImage" type="file" accept="image/*" ref="file" v-on:change="onFileChange()">
         <div>
    <button type="submit">Commit</button>
    </div>
  </form>
</template>


<script>
export default {
  props: {
    post: {},
    errors: ''
  },
  data(){
    return{
      uploadedImage:''
    }
  },
    methods: {
    onFileChange() {
      let file = event.target.files[0] || event.dataTransfer.files
      let reader = new FileReader()
     reader.onload = () => {
       console.log(event.target.result)
        this.uploadedImage = event.target.result
        this.post.image = this.uploadedImage
      }
   
      console.log( reader.readAsDataURL(file))
      
    }
    }
}
</script>

<style>
</style>