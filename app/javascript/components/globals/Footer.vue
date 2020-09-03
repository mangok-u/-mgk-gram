<template>
    <div class="footer">
      <div class="footer-box">
        <ul class="footer-box-row">
          <li>基本データ</li>
          <li>ヘルプ</li>
          <li>プレス</li>
          <li>API</li>
          <li>求人</li>
          <li>プライバシー</li>
        </ul>
        <ul class="footer-box-row">
          <li>利用規約</li>
          <li>所在地</li>
          <li>人気アカウント</li>
          <li>ハッシュタグ</li>
          <li>言語</li>
        </ul>
        <p class="footer-box-bottom">
          @2020 MGKGRAM FROM MANGOKU
        </p>
      </div>
    </div>
</template>

<script>


</script>

<style scoped lang="scss">

.footer{
  padding:15px 0;
  background: rgba(var(--b3f, 250, 250, 250), 1);
  &-box{
    width:80%;
    max-width: 400px;;
    margin:0 auto;
    text-align: center;
    &-row{
      display:flex;
      justify-content: space-between;
      margin-bottom:15px;
      li{
        font-size:1.2rem;
        color: #00376b;
      }
    }
    &-bottom{
      color: rgba(var(--f52,142,142,142),1);
    }
  }

}

</style>