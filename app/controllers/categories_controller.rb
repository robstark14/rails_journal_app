class CategoriesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new

  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    @category = Category.find(params[:id])
    
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      render :edit
    end  
    
  end
  
  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.update(user_id: current_user.id)

    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end

  end


  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  def correct_user
    @category =current_user.categories.find_by(id: params[:id])
    redirect_to categories_path, notice: "Not Authorized to view other user's categories"
  end

  private

    def category_params
      params.require(:category).permit(:name, :description, :user_id)
    end
end
