class Api::TasksController < ApplicationController
  protect_from_forgery except: :update
  def index
    render json: Task.all.sort_by{|task| task.completed ? 1 : 0}
  end

  def create
    new_task = Task.create(description: params[:description])
    render json: {completed: 'true', new_task: new_task}
  end

  def update
    task = Task.find(params[:id])
    completed = params[:completed]
    completed_bool = completed == 'true' ? true : false
    task.update(completed: completed_bool)
    render json: {completed: 'true', taskId: task.id}
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: {completed: 'true'}
  end
end
