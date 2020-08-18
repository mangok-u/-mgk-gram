import Vue from 'vue'

import Router from 'vue-router'
import Profile from './components/profiles/Profile.vue'



import PostsDetail from './components/posts/PostsDetail.vue'
import PostsNew from './components/posts/PostsNew.vue'
import PostsEdit from './components/posts/PostsEdit.vue'
import LoginForm from "./components/sign/LoginForm.vue"
import Photodetail from 'Photodetail.vue'
import SignupForm  from "./components/sign/SignupForm.vue"



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
      component: PostsEdit ,
      props:routes =>({
        id: Number(routes.params.id)  //型をけっていできないので指定する
      })},
      { path: '/user/login',  // :id は数値のみに制限する
      name: 'LoginForm',
      components: {//複数系にすると呼び出せる！！
        default: LoginForm 
      } },
      { path: '/user/signup', 
      name: 'SignupForm',
      components: {
        // login: SignupForm 
        default: SignupForm 
      } },
    

    
  ]
  //   router
})