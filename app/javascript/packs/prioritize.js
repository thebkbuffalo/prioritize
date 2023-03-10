import Vue from 'vue'
import Prioritize from '../src/components/prioritize.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#prioritize-app',
    render: h => h(Prioritize)
  }).$mount()
})
