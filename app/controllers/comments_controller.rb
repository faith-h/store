class CommentsController < ApplicationController
  before_action :set_pet

  def new
    @comment = Comment.new
  end

  def create
    @comment = @pet.comments.new(comment_params)
    if @comment.save
      redirect_to department_pet_path(@pet.department_id, @pet)
    else
      render :new
    end
  end

  private
    def set_pet
      @pet = Pet.find(params[:pet_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :author)
    end
end