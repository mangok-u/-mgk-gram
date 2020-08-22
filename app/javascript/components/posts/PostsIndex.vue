<template>
  <div id="post-index">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
        </tr>
        <!-- <tr v-for="post in posts" :key="post.id">
           <td><router-link :to="{ name: 'PostsDetail', params: { id: post.id } }">{{ post.id }}</router-link></td>
          <td>{{ post.id }}</td>
          <td>{{ post.name }}</td>
        </tr> -->
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      posts: []
    }
  },
  mounted(){
    axios
      .get('/api/v1/posts.json')
      .then(response => (this.posts = response.data))
  },
 
}
</script>

<style scoped lang="scss">
.posts-new{
 padding-top:60px;
 background: rgba(var(--b3f, 250, 250, 250), 1);
 text-align:center;
}
</style>
