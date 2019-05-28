class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @tasks.each do |task|
      if task.completed == "false"
        @task_status = 'TO DO'
      else
        @task_status = 'DONE'
      end
    end
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    # 1. Construire un object Task a partir de params[:task]
    task = Task.new(task_params)
    # 2. Sauver l'objet en DB
    task.save
    # 3. Redirige vers la liste des tasks
    redirect_to tasks_path
  end

  def edit
    set_task
  end

  def update
    set_task
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def completed?
    @completed
  end

  def mark_as_done
    set_task
    @task.update('completed' => '1')

    redirect_to task_path(@task)
  end

  def destroy
    set_task
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
