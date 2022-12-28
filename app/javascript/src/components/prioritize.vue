<template>
  <div>
    <h1><span class='blue'>Priori</span><span class='purple'>tize</span></h1>

    <h2>Tasks:</h2>
    <button id='toggleListsButton' @click='showFullList = !showFullList'>Show All The Tasks</button>
    <ul v-if='!showFullList'>
      <li v-for='task in tasks' v-if='!task.completed' :class="`task-${task.id}`">
        {{ task.description }} 
        <button class='completeBtn' @click="markComplete(task.id)">mark complete</button>
      </li>
    </ul>
    <ul v-if='showFullList'>
      <li v-for='task in tasks' :class="`task-${task.id}`">
        {{ task.description }} 
        <button class='completeBtn' @click="markComplete(task.id)">mark complete</button>
      </li>
    </ul>
  </div>
</template>

<script>
  import Task from '../models/task';

  export default {
    name: 'prioritize',
    
    data: function () {
      return {
        tasks: [],
        showFullList: false
      }
    },

    methods: {
      setTasks: function (resp) {
        this.tasks = resp.data;
      },
      markComplete: function (taskId) {
        Task.updateTask(taskId, 'true');
        this.tasks.find(t=>t.id == taskId).completed = true;
      }
    },

    mounted: function () {
      Task.fetch().then(this.setTasks);
    }
  }
</script>
