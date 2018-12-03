<template>
  <div id="comments">
    <div v-if="loaded">
      <div v-if="discussion.error">{{discussion.error}}</div>
      <Discussion v-else></Discussion>
    </div>
    <i v-else class="fa fa-spinner fa-spin"></i>
  </div>
</template>

<script>
export default {
  computed: {
    discussion() {
      return this.$store.state.discussion
    },
    loaded() {
      return !this.$store.state.loading
    }
  },
}
</script>
