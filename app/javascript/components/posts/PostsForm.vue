<template>
  <div class="posts-form">
    <h2 v-if="id >= 0">Edit Post</h2>
    <h2 v-else>New Post</h2>
    <div class="form">
      <form @submit.prevent="$emit('submittt')">   
        <div class="form-error" v-if="errors.length != 0">
          <ul v-for="e in errors" :key="e">
            <li><font color="red">{{ e }}</font></li>
          </ul>
        </div>
        <div class="form-box">
          <div class="form-box-img">
            <img  v-if="id >= 0" :src="post.image">
            <img v-else-if="imgSrc !==''" :src="imgSrc">
              <!-- imgが無いときにから表示を防ぐ -->
            <div @click="selectFile">画像を更新する</div>
            <input  name="uploadedImage" type="file" accept="image/*" ref="file" placeholder="画像を更新する" v-on:change="onFileChange()" id="select-file">
          </div>
          <div class="form-box-text">
             <textarea   v-model="post.text"
                         cols="40" rows="10" 
                         maxlength="300" 
                         placeholder="キャプションを入力">
             </textarea>
          </div>
          <button type="submit">Commit</button>
        </div>
        
      </form>
    </div>
  </div>
</template>


<script>
export default {
  props: {
    post: {},
    errors: '',
    id:''  //idが飛んでいるかでnewかeditチェック
  },
  data(){
    return{
      uploadedImage:'',
      imgSrc:''
    }
  },

  mounted(){
     console.log(this.post)

  },
 
    methods: {
      onFileChange() {
        let file = event.target.files[0] || event.dataTransfer.files
        this.imgSrc=URL.createObjectURL(file);
        let reader = new FileReader()

      reader.onload = () => {
        
          this.uploadedImage = event.target.result
          this.post.image = this.uploadedImage
        }
      reader.readAsDataURL(file)
      },
      selectFile(){
        var a = document.getElementById("select-file");
        a.click();
      
      }
    }
}
</script>

<style scoped lang="scss">
.posts-form{
 background: white;
 width:400px;
 height:680px;
 margin:0 auto;
 border: 1px solid rgba(var(--b6a,219,219,219),1);
 padding:40px 0;
 h2{
   font-size:1.8rem;
   margin-bottom:30px;
   font-family:'Tahoma';
 }
 .form{
   width:90%;
   margin:0 auto;

   &-error{
     margin-bottom:30px;
   }
   &-box{

     &-img{
       width:50%;
       margin:0 auto;
       margin-bottom:30px;
       img{
         width:100%;
         height:250px;
         object-fit: cover;
         margin-bottom:20px;
       }
       div{
           border: 1px solid transparent;
           background-color: #0095f6;
           width:100%;
           height:32px;
           line-height:30px;
           font-size:1.4rem;
           color:white;
           border-radius:3px;
           font-weight:bold;
       }
       #select-file{
         display: none;
       }
     }
     &-text{
       margin-bottom:40px;
       textarea{
        border: 1px solid rgba(var(--b6a,219,219,219),1);
        border-radius: 0.67em;  
        padding: 0.5em;        
        background: rgba(var(--b3f, 250, 250, 250), 1);
        width: 70%;            
        height: 120px;          
        font-size: 1em;          
        line-height: 1.2;    
       }
     }
     button{
        border: 1px solid transparent;
           background-color: #0095f6;
           width:70%;
           height:32px;
           font-size:1.4rem;
           color:white;
           border-radius:3px;
           font-weight:bold;
     }
   }
 }
}
</style>