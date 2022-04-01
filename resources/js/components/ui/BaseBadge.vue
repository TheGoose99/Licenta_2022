<template>
  <span class="badge" :class="type">
    {{ text }}
  </span>
</template>

<script>
export default {
  props: ['type', 'title'],
  computed: {
    text() {
      return this.title.toUpperCase();
    }
  }
}
</script>

<style scoped>
.badge {
  font-size: 24px;
  background-color: #ccc;
  color: #252525;
  border-radius: 30px;
  padding: 0.5rem 1.5rem;
  display: inline-block;
  margin-right: 0.5rem;
}

.option1 {
  background-color: #3d008d;
  color: white;
}

.option2 {
  background-color: #71008d;
  color: white;
}

.option3 {
  background-color: #F7931A;
  color: white;
}

.option4 {
  background-color: red;
  color: white;
}
</style>