<template>
  <div>
    <button v-if="!link" :class="mode">
      <slot></slot>
    </button>
    <router-link v-else :to="to" :class="mode">
      <slot></slot>
    </router-link>
  </div>
</template>

<script>
export default {
  props: {
    mode: {
      type: String,
      required: false,
      default: null
    },
    link: {
      type: Boolean,
      required: false,
      default: false
    },
    to: {
      type: String,
      required: false,
      default: '/'
    }
  }
}
</script>

<style scoped>
button,
a {
  text-decoration: none;
  padding: 0.75rem 1.5rem;
  font: inherit;
  background-color: #F7931A;
  border: 1px solid #F7931A;
  color: white;
  cursor: pointer;
  border-radius: 30px;
  margin-right: 0.5rem;
  display: inline-block;
}

.flat a:hover, .outline a:hover
.flat a:active, .outline a:active
.flat button:hover, .outline button:hover
.flat button:active, .outline button:active {
  background-color: #f58a09;
  border-color: #f58a09;
}

.flat {
  background-color: transparent;
  color: #ffffff;
  border: none;
  font-size: 18px;
  padding: 8px 16px;
  border-radius: 99px;
  font-weight: bold;
}

.outline {
  background-color: transparent;
  border-color: #F7931A;
  color: #f58a09;
}

.navlink {
  background-color: transparent;
  border: none;
  color: white;
  font-weight: bold;
  font-size: 18px;
position:relative; left:10px; top:2px
}

.navlink::after {
	content: '';
	display: block;
	width: 0;
	height: 2px;
	background: #fff;
	transition: width .3s;
}

.navlink:hover::after {
	width: 100% ;
	transition: width .3s;
}

.flat:hover,
.flat:active,
.outline:hover,
.outline:active {
  background-color: #f58a09;
}
</style>