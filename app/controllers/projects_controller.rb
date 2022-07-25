class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy]
  load_and_authorize_resource

  def index
    @projects = current_user.projects
  end

  def show
    @user_bugs = @project.bugs
    # @user_bugs = @project.bugs.where(user_id: current_user.id).or(@project.bugs.where(developer_id: current_user.id))
  end

  def new
    @project = current_user.projects.new
  end

  def edit
  end

  def create
    @project = current_user.projects.create(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @proj_para = project_params
    @proj_para["user_ids"][0] = "#{current_user.id}"
    respond_to do |format|
      if @project.update(@proj_para)
        format.html { redirect_to project_path(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def project_params
    params.require(:project).permit(:name, :description, :user_ids => [])
  end

  def set_project
    @project = current_user.projects.find(params[:id])
    @page_title = @project.name
  end

end
