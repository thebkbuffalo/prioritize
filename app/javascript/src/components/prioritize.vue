<template>
  <div>
    <h1><span class='blue'>Priori</span><span class='purple'>tize</span></h1>

    <h2>Tasks:</h2>
    <button id='toggleListsButton' @click='toggleList()'>Show All The Tasks</button>
    <ul v-if='!showFullList'>
      <li v-for='task in tasks' v-if='!task.completed'>
        {{ task.description }} 
        <button class='completeBtn' @click="updateTask(task.id, 'true')">mark complete</button>
      </li>
    </ul>
    <ul v-if='showFullList'>
      <li v-for='task in tasks' :class="task.completed ? 'completedTask' : ''">
        {{ task.description }} 
        <button v-if='task.completed' class='completeBtn' @click="updateTask(task.id, 'false')">Mark as NOT complete</button>
        <button v-if='!task.completed' class='completeBtn' @click="updateTask(task.id, 'true')">mark complete</button>
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
      updateTask: function (taskId, completed) {
        Task.updateTask(taskId, completed);
        if(completed == 'true'){
          this.tasks.find(t=>t.id == taskId).completed = true;
        }else{
          this.tasks.find(t=>t.id == taskId).completed = false;
        }
      },
      // markComplete: function (taskId) {
      //   Task.updateTask(taskId, 'true');
      //   this.tasks.find(t=>t.id == taskId).completed = true;
      // },
      // markIncomplete: function (taskId) {

      // }
      toggleList: function () {
        let toggleButton = document.getElementById('toggleListsButton');
        if(this.showFullList == false){
          this.showFullList = true
          toggleButton.innerHTML = 'Show NonCompleted Tasks'
        }else{
          this.showFullList = false
          toggleButton.innerHTML = 'Show All The Tasks'
        }
      }
    },

    mounted: function () {
      Task.fetch().then(this.setTasks);
    }
  }
</script>
