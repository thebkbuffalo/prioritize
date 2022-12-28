class Api::TasksController < ApplicationController
  protect_from_forgery except: :update
  def index
    render json: Task.all
  end

  def update
    task = Task.find(params[:id])
    completed = params[:completed]
    if completed = 'true'
      task.update(completed: true)
      render json: {completed: 'true', taskId: task.id}
    else
      task.update(completed: false)
      render json: 'updated'
    end
  end
end
