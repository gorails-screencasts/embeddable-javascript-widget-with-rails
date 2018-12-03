<template>
  <div>
    <h3><span v-if="count > 0">{{count}}</span> Comments</h3>

    <div v-for="comment in comments" class="mb-4">
      <div><span class="font-weight-bold">{{comment.name}}</span> comment:</div>
      <div>{{comment.body}}</div>
    </div>

    <form @submit.prevent="submit" ref="form">
      <div v-if="errors.length > 0" class="alert alert-danger">
        <div v-for="error in errors">{{error}}</div>
      </div>

      <div>
        <input v-model="name" type="text" name="comment[name]" required placeholder="Full name" />
      </div>

      <div>
        <input v-model="email" type="text" name="comment[email]" required placeholder="Email address" />
      </div>

      <div>
        <textarea v-model="body" name="comment[body]" required placeholder="Add a comment..."></textarea>
      </div>

      <div style="text-align: right">
        <button>Post comment</button>
      </div>
    </form>
  </div>
</template>

<script>
import { mapFields } from 'vuex-map-fields'

export default {
  data: function () {
    return {}
  },

  methods: {
    submit() {
      let formData = new FormData(this.$refs.form)
      this.$store.dispatch('createComment', formData)
    }
  },

  computed: {
    ...mapFields([
      'name',
      'email',
      'body',
      'errors',
    ]),

    comments() {
      return this.$store.state.discussion.comments
    },
    count() {
      return this.$store.state.discussion.comments.length
    }
  },
}
</script>

<style scoped>
input, textarea, button {
  box-sizing: border-box;
}

input, textarea {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background-color: #f1f5f8;
  border-color: #f1f5f8;
  border-radius: .25rem;
  border-width: 0;
  color: #606f7b;
  display: block;
  line-height: 1.25;
  margin-bottom: 8px;
  padding-left: 1rem;
  padding-right: 1rem;
  padding-top: .75rem;
  padding-bottom: .75rem;
  width: 100%;
}

button {
  -webkit-appearance: button;
  background-color: #3490dc;
  border: none;
  border-radius: .25rem;
  color: white;
  display: inline-block;
  padding-left: 1rem;
  padding-right: 1rem;
  padding-top: .75rem;
  padding-bottom: .75rem;
  text-align: center;
  text-decoration: none;
}
</style>
