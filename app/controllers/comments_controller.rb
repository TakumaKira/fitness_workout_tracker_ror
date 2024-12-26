class CommentsController < ApplicationController
  include Authentication
  before_action :authenticate_user!
  before_action :set_workout

  def create
    @comment = @workout.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @workout, notice: "Comment was successfully added."
    else
      redirect_to @workout, alert: "Comment couldn't be added."
    end
  end

  def destroy
    @comment = @workout.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to @workout, notice: "Comment was successfully deleted."
    else
      redirect_to @workout, alert: "You can't delete this comment."
    end
  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
