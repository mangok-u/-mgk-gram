<template>
  <div id="profile-header">
    <div class="profile-header"></div>
      <ul class="profile-header-box">
        <li class="profile-header-box-li">投稿</li>
        <li class="profile-header-box-li">MGKTV</li>
        <li class="profile-header-box-li">保存済み</li>
        <li class="profile-header-box-li">タグ付けされている人</li>
      </ul>
  </div>


</template>

<style scoped lang="scss">

#profile-header{
background-color: rgba(var(--b3f,250,250,250),1); 
}
.profile-header{
  width:90%;
  margin:0 auto;
  max-width:970px;
  border-top:1px solid rgba(var(--b38,219,219,219),1);

}

.profile-header-box{
  width:80%;
  height:60px;
  max-width: 380px;
  display:flex;
  align-items: center;
  justify-content: space-between;
  margin:0 auto;
  font-size:1.4rem;
}

</style>