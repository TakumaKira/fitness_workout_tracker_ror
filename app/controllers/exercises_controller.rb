class ExercisesController < ApplicationController
  include Authentication
  before_action :authenticate_user!
  before_action :set_exercise, only: [ :show, :edit, :update, :destroy ]

  def index
    @exercises = current_user.exercises
  end

  def show
  end

  def new
    @exercise = current_user.exercises.build
  end

  def edit
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      redirect_to exercises_path, notice: "Exercise was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercises_path, notice: "Exercise was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path, notice: "Exercise was successfully deleted."
  end

  private

  def set_exercise
    @exercise = current_user.exercises.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description)
  end
end
