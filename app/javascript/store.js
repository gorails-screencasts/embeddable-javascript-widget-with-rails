import Vue from 'vue'
import Vuex from 'vuex'

import { getField, updateField } from 'vuex-map-fields'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    comments: [],
    name: '',
    email: '',
    body: '',
    errors: [],
  },

  getters: {
    getField,
  },

  mutations: {
    updateField,

    load(state, comments) {
      state.comments = comments
    },

    addComment(state, comment) {
      state.comments.push(comment)
    },

    setErrors(state, errors) {
      state.errors = errors
    },

    clearComment(state) {
      state.name  = ''
      state.email = ''
      state.body  = ''
    }

  },

  actions: {
    async loadComments({ commit }) {
      let url = window.location.href

      fetch(`http://localhost:3000/api/v1/discussions/${encodeURIComponent(url)}`, {
        headers: { accept: 'application/json' }
      })
      .then(response => response.json())
      .then(data => commit('load', data.comments))
    },

    async createComment({ commit }, formData) {
      let url = window.location.href

      fetch(`http://localhost:3000/api/v1/discussions/${encodeURIComponent(url)}/comments`, {
        headers: { accept: 'application/json' },
        method: 'post',
        body: formData,
      })
      .then(response => response.json())
      .then(comment => {
        if (comment.errors) {
          commit('setErrors', comment.errors)
        } else {
          commit('setErrors', [])
          commit('clearComment')
          commit('addComment', comment)
        }
      })
    }
  }
})

window.store = store
export default store
