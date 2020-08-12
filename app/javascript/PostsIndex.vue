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

<style scoped>
#post-index{

}
p {
  font-size: 2em;
  text-align: center;
}
</style>
