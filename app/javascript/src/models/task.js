import axios from 'axios';

export default {
  fetch: () => {
    return axios.get('/api/tasks')
  },
  updateTask: (taskId, completed) => {
    return axios.put('/api/tasks/'+taskId+'?completed='+completed);
  },
  postTask: (description) => {
    return axios.post('/api/tasks', {description: description});
  },
  deleteTask: (taskId) => {
    return axios.delete('/api/tasks/'+taskId)
  }
}
