class BugsController <   ApplicationController
  before_action :set_project, only: %i[ new create]
  before_action :set_bug, only: %i[ show edit update destroy]
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
    @bug = @project.bugs.new
  end

  def edit      
  end

  def create
    @bug = @project.bugs.new(bug_params)
    @bug.user_id = current_user.id
    respond_to do |format|
        if @bug.save
          format.html { redirect_to project_bug_path(@project,@bug), notice: "Bug was successfully created." }
          format.json { render :show, status: :created, location: @bug }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @bug.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    respond_to do |format|
        if @bug.update(bug_params)
          if @bug.developer_id == current_user.id or @bug.user_id == current_user.id
            format.html { redirect_to project_bug_path(@project, @bug), notice: "Bug was successfully updated." }
            format.json { render :show, status: :ok, location: @bug }
          else
            format.html { redirect_to project_path(@project), notice: "Bug was successfully updated." }
            format.json { render :show, status: :ok, location: @bug }
          end
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @bug.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy 
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project), notice: "Bug was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def bug_params
      params.require(:bug).permit(:title, :description, :developer_id, :deadline, :image,  :bug_type, :status, :user_id, :project_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_bug
    @project = Project.find(params[:project_id])
    @bug = Bug.find(params[:id])
    @bug_title = @bug.title

  end

end