import axios from 'axios';

export default {
  fetch: () => {
    return axios.get('/api/tasks')
  }
}
