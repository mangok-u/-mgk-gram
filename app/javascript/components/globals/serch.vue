<template>
 <form>
  <el-input-number v-model="num" @change="handleChange" :min="1" :max="10"></el-input-number>
  <el-input-number v-model="num1" @change="handleChange" :min="1" :max="10"></el-input-number>
  </form>
</template>
<script>
  export default {
    data() {
      return {
        num: 1,
        num1:4
      };
    },
    methods: {
      handleChange(value) {
        console.log(value)
      },
      log(){
       console.log(this.num1)
      }
    }
  };
</script>

<style scoped lang="scss">

.RootApp >>> .el-input__inner {
  height:20px;
}




</style>