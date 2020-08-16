/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import App from '../app.vue'
import router from '../router.js'
import firebase from 'firebase'
import store from '../store';
import "firebase/auth";
import '../plugins'

 //普通にnpminstall de行けた
const config = {
  apiKey: "AIzaSyDxmb4KQEh-naza2Dt-a48_jFwGf6UQDg8",
    authDomain: "mgkgram.firebaseapp.com",
    databaseURL: "https://mgkgram.firebaseio.com",
    projectId: "mgkgram",
    storageBucket: "mgkgram.appspot.com",
    messagingSenderId: "567636004445",
    appId: "1:567636004445:web:2520afdff18b8d7bf987b4"
};

plugins: [
 
  "/plugins/auth-check"
],
 
firebase.initializeApp(config);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router: router,
    store:store,
    render: h => h(App)
   
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
