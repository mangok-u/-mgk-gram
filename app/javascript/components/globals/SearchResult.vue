<template>
 <div class="search-result">
   <ul class="search-result-list">
     <li class="search-result-list-row" v-for="user in users" :key="user.id">
     </li>
   </ul>

 </div>
</template>

<script>
  export default {
    props:{
      users:Array
    },
    data() {
      return {
      
      };
    },
   
     
  };
</script>

<style scoped lang="scss">

.search-result{
 width:100%;
 height:100%;
 border: 1px solid rgba(var(--b6a, 219, 219, 219), 1);
 background:white;
 box-shadow: 0 0 5px rgba(var(--jb7,0,0,0),.0975);
 border-radius: 3px;
 &-list{
   height:100%;
   overflow: scroll;
   &-row{
    width:100%;
    height:62px;
    border-bottom: 1px solid rgba(var(--b6a, 219, 219, 219), 1);
    }
 }
}




</style>