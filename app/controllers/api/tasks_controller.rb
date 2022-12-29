class Api::TasksController < ApplicationController
  protect_from_forgery except: :update
  def index
    render json: Task.all
  end

  def create
    new_task = Task.create(description: params[:description])
    render json: {completed: 'true', new_task: new_task}
  end

  def update
    task = Task.find(params[:id])
    completed = params[:completed]
    if completed == 'true'
      task.update(completed: true)
      render json: {completed: 'true', taskId: task.id}
    else
      task.update(completed: false)
      render json: {completed: 'true', taskId: task.id}
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: {completed: 'true'}
  end
end
