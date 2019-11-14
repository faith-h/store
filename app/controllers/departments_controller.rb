require 'pry'
class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(params.require(:department).permit(:name))

    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])

    if @department.update(params.require(:department).permit(:name))
      redirect_to departments_path
    else
      render :edit
    end
  end

  def destroy
    Department.find(params[:id]).destroy
    redirect_to departments_path
  end

  # private

  # def departments_params
  #   departments.require(:department).permit(:name)
  # end



end
