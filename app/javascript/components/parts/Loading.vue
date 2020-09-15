<template>
  <div class="loading-container">
    <vue-loading  type="spin" color="#333" :size="{ width: '50px', height: '50px' }"></vue-loading>
  </div>
</template>

<script>
import { VueLoading } from 'vue-loading-template'

export default{
  components:{
    VueLoading
  }

}

</script>

<style scoped lang="scss">
.loading-container{
  width:100%;
  height:100%;
  position:fixed;
  top:0;
  left:0;
  background: rgba(45,45,45, 0.5);
  z-index:100;
  .vue-loading{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translateY(-50%) translateX(-50%);
  }
}

</style>