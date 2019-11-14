class PetsController < ApplicationController
  before_action :set_department
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = @department.pets
  end

  def show
  end

  def new
    @pet = @department.pets.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @pet = @department.pets.new(pet_params)
    if @pet.update(pet_params)
      redirect_to [@department, @pet]
    else
      render :new
    end
  end

  def update
    if @pet.update(pet_params)
      redirect_to [@department, @pet]
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to department_pets_path(@department)
  end

    private
    def set_department
      @department = Department.find(params[:department_id])
    end

    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :species, :color, :age, :favorite_thing, :gender)
    end

end
