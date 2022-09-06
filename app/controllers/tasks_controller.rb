class TasksController < ApplicationController
  # before_action :authenticate_user!
  before_action :get_category
  # GET /tasks or /tasks.json
  # def index
  #   @tasks = @category.tasks
  # end


  # GET /tasks/new
  # def new
  #   # @task = Task.new
  #   @task = @category.tasks.build
  # end

  # GET /tasks/1/edit
  
  # POST /tasks or /tasks.json
  def create
    @task = @category.tasks.build(task_params)   
    if @task.save
      redirect_to category_path(@category)
      else
        render :new
      end
      
    end
  def tasks_today
    @tasks = @category.tasks.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
  end
  
  def show
    @task = @category.tasks.find(params[:id])
  end
  def edit
  
    # @task = @category.tasks.find(@task)
    # @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  def update
  
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to category_task_path(@category)
    else
      render action: 'edit'
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task= @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def get_category
    @category = Category.find(params[:category_id])
  end
    
    # def set_task
    #   @task = Task.find(params[:id])
    # end
  
    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :task_id, :details, :user_id)
    end
end
