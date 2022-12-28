<template>
  <div>
    <h1><span class='blue'>Priori</span><span class='purple'>tize</span></h1>
    <div id='newTask'>
      <input v-model='form.description' class='newTaskInput' type='text' placeholder='new task'/> <button @click="addNewTask()">Add Task</button>
    </div>
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
        form: {description: ''},
        showFullList: false
      }
    },

    methods: {
      setTasks: function (resp) {
        this.tasks = resp.data;
      },
      updateListUi: function (resp) {
        if(resp['data']['completed'] == 'true'){
          Task.fetch().then(this.setTasks);
        }else{
          alert('something went wrong')
        }
      },
      updateTask: function (taskId, completed) {
        Task.updateTask(taskId, completed).then(this.updateListUi)
      },
      addNewTask: function() {
        let description = this.form.description;
        Task.postTask(description).then(this.updateListUi);
        this.form.description = '';
      },
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
