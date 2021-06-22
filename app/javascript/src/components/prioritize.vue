<template>
  <div>
    <h1><span class='blue'>Priori</span><span class='purple'>tize</span></h1>

    <h2>Tasks:</h2>
    <ul>
      <li v-for='task in tasks'>{{ task.description }}</li>
    </ul>
  </div>
</template>

<script>
  import Task from '../models/task';

  export default {
    name: 'prioritize',
    
    data: function () {
      return {
        tasks: []
      }
    },

    methods: {
      setTasks: function (resp) {
        this.tasks = resp.data;
      }
    },

    mounted: function () {
      Task.fetch().then(this.setTasks);
    }
  }
</script>
