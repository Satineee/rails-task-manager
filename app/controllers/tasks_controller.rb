class TasksController < ApplicationController
  def index
    @index = Task.all
  end

  def show
    @detail = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    flash[:notice] = "la task a bien été créé"
    redirect_to task_path(@task)
  end

  def new
    @task = Task.new
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:notice] = "la task a bien été mise à jour"
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
