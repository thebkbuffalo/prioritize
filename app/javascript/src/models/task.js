import axios from 'axios';

export default {
  fetch: () => {
    return axios.get('/api/tasks')
  },
  updateTask: (taskId, completed) => {
    return axios.put('/api/tasks/'+taskId+'?completed='+completed);
  }
}
