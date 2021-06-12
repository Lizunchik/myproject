class TodosController < ApplicationController
    before_action :set_todo, only: :update
	#before_action :set_or_create_project, only: :create

  def create
  @new_todo = Todo.new(todo_params)
  render json: @new_todo, status: :created, location: todos_path(@new_todo)

  end

  def update
	@todo.isCompleted = true;
	render json: @todo
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_or_create_project
    @project =
      if project_params[:projectname]
        Project.find_or_create_by(projectname: project_params[:projectname])
      else
        Project.find(project_params[:id])
      end
  end

  def todo_params
    params.fetch(:todo, {}).permit(:todoname)
  end

  def project_params
    params.fetch(:project, {}).permit(:projectname, :id)
  end
end