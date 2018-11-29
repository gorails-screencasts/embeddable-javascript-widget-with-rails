<template>
  <div id="comments">
    <h3><span v-if="count > 0">{{count}}</span> Comments</h3>

    <div v-for="comment in comments" class="mb-4">
      <div><span class="font-weight-bold">{{comment.name}}</span> comment:</div>
      <div>{{comment.body}}</div>
    </div>

    <form @submit.prevent="submit" ref="form">
      <div v-if="errors.length > 0" class="alert alert-danger">
        <div v-for="error in errors">{{error}}</div>
      </div>

      <div class="form-group">
        <input v-model="name" type="text" name="comment[name]" required placeholder="Full name" class="form-control" />
      </div>

      <div class="form-group">
        <input v-model="email" type="text" name="comment[email]" required placeholder="Email address" class="form-control" />
      </div>

      <div class="form-group">
        <textarea v-model="body" name="comment[body]" required placeholder="Add a comment..." class="form-control full-width"></textarea>
      </div>

      <div class="form-group text-right">
        <button class="btn btn-primary">Post comment</button>
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
      return this.$store.state.comments
    },
    count() {
      return this.$store.state.comments.length
    }
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
