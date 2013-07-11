class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'success'
      redirect_to tasks_path
    else
      flash[:error] = @task.errors.full_messages.to_sentence
      render 'new'
    end

  end

  def index
    @tasks = Task.all
  end

  def update
    task = Task.find(params[:id])
    task.update_attribute(:complete, params[:complete])

    render json: {complete: task.complete, id: task.id}
    #redirect_to tasks_path, status: 303
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

end
