<template>
  <div id="profile-header">
    <ul class="profile-header">
      <li class="profile-header-li">投稿</li>
      <li class="profile-header-li">MGKTV</li>
      <li class="profile-header-li">保存済み</li>
      <li class="profile-header-li">タグ付けされている人</li>
    </ul>
  </div>


</template>

<style scoped lang="scss">
#profile-header{
  height:60px;
  width:90%;
  margin:0 auto;
  max-width:970px;
  border-top:1px solid rgba(var(--b38,219,219,219),1);

}

.profile-header{
  width:45%;
  height:100%;
  display:flex;
  align-items: center;
  justify-content: space-between;
  margin:0 auto;
  font-size:1.4rem;
}

</style>