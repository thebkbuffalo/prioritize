<template>
  <div>
    <h1><span class='blue'>Priori</span><span class='purple'>tize</span></h1>

    <h2>Tasks:</h2>
    <ul>
      <li v-for='task in tasks' v-if='!task.completed' :class="`task-${task.id}`">
        {{ task.description }} 
        <button class='completeBtn' @click="markComplete(task.id)">mark complete</button>
      </li>
    </ul>
  </div>
</template>

<script>
  import Task from '../models/task';
  import axios from 'axios';

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
      },
      markComplete: function (taskId) {
        Task.updateTask(taskId, 'true').then((resp) => {
          let data = resp['data']
          if(data['completed'] === 'true'){
            $vm.tasks.find(t=>t.id == data['taskId']).completed = true;
          }
        })
      }
    },

    mounted: function () {
      Task.fetch().then(this.setTasks);
    }
  }
</script>
