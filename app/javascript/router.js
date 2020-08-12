import Vue from 'vue'

import Router from 'vue-router'
import Profile from 'Profile.vue'



import PostsDetail from 'PostsDetail.vue'
import PostsNew from 'PostsNew.vue'
import PostsEdit from 'PostsEdit.vue'
import LoginForm from "LoginForm.vue"
import Photodetail from 'Photodetail.vue'
import SignupForm  from "SignupForm.vue"



Vue.use(Router)
export default new Router({
  routes: [
    { path: '/',
      components:{
        default:Profile 
        // login: LoginForm 
      },
    children:[
      {
        path: 'photo/:id(\\d+)',
        name:'Photodetail',
        components:{
          profile: Photodetail,
        },
       
      }

    ]  
  },
    { path: '/posts/:id(\\d+)',  // :id は数値のみに制限する
      name: 'PostsDetail',
      component: PostsDetail  },
    { path: '/posts/new',
      name: 'PostsNew',
      component: PostsNew    },
    { path: '/posts/:id(\\d+)/edit',
      name: 'PostsEdit',
      component: PostsEdit    },
      { path: '/user/login',  // :id は数値のみに制限する
      name: 'LoginForm',
      components: {//複数系にすると呼び出せる！！
        login: LoginForm 
      } },
      { path: '/user/signup', 
      name: 'SignupForm',
      components: {
        login: SignupForm 
      } },
    

    
  ]
  //   router
})