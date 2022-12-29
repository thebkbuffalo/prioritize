require 'spec_helper'
require 'rails_helper'

RSpec.describe Api::TasksController, type: :controller do

  before(:each) do
    Task.destroy_all
  end

  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST tasks' do
    it 'creates a new task' do
      post :create, params: {description: 'new test task'}
      json = JSON.parse(response.body)
      expect(json['completed']).to eq('true')
      expect(json['new_task']['description']).to eq('new test task')
    end
  end

  describe 'PUT task' do
    it 'updates a task' do
      post :create, params: {description: 'new test task'}
      task_id = Task.last.id
      put :update, params: {id: task_id, completed: 'true'}
      expect(Task.last.completed).to eq(true)
    end
  end

  describe 'DELETE task' do
    it 'deletes a task' do
      post :create, params: {description: 'nest test task'}
      task_id = Task.last.id
      delete :destroy, params: {id: task_id}
      json = JSON.parse(response.body)
      expect(json['completed']).to eq('true')
    end
  end

end