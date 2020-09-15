import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = () => {
    return new Vuex.Store({
        state: {
            currentUser:"",
            loginInfo:""
        },
        mutations: {
            setUser(state, payload) {
                state.currentUser = payload
            },
        },
        actions: {
        }
    })
}

export default store



// import Vue from 'vue';
// import Vuex from 'vuex';


// Vue.use(Vuex);

// export default new Vuex.Store({
//       state: {
//         currentUser: null,
//     },
//     mutations: {
//         setUser(state, payload) {
//             state.currentUser = payload
//         },
//     },
//     actions: {
//     }


// })