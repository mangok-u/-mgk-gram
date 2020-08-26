<template>
  <div class="search-result">
    <ul class="search-result-list">
      <li class="search-result-list-row" v-for="user in users" :key="user.id">
        <div class="search-result-list-row-box">
          <div class="search-result-list-row-box-left">
            <img v-if="user.image===null" class="search-result-list-row-box-left-img" src="/images/damy.jpg"> 
            <img v-else class="search-result-list-row-box-left-img" :src=user.image> 
          </div>
          <div class="search-result-list-row-box-right">
            <p class="search-result-list-row-box-right-user_name">{{user.user_name}}</p>
            <p class="search-result-list-row-box-right-full_name">{{user.full_name}}</p>
          </div>
        </div>
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
   max-height:400px;
   overflow: scroll;
   &-row{
    width:100%;
    height:62px;
    border-bottom: 1px solid rgba(var(--b6a, 219, 219, 219), 1);
    display: flex;
    align-items: center;
    &-box{
      width:95%;
      height:90%;
      margin:0 auto;
      display: flex;
      align-items: center;
      &-left{
        width:40px;
        height:40px;
        margin-right:5px;
        &-img{
          width:100%;
          height:100%;
          object-fit:cover;
          border-radius: 50%;
        }
      }
      &-right{
        &-user_name{
          font-size:1rem;
        }
        &-full_name{
          font-size:1rem;
          color: rgba(var(--f52,142,142,142),1);
        }
      }
    }
    }
 }
}




</style>