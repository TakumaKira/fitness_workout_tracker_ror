class WorkoutsController < ApplicationController
  include Authentication
  before_action :authenticate_user!
  before_action :set_workout, only: [ :show, :edit, :update, :destroy ]

  def index
    @workouts = current_user.workouts
  end

  def show
  end

  def new
    @workout = current_user.workouts.build
    3.times { @workout.workout_exercises.build }
    @available_exercises = current_user.exercises
  end

  def create
    @workout = current_user.workouts.build(workout_params)

    if @workout.save
      redirect_to @workout, notice: "Workout was successfully created."
    else
      @available_exercises = current_user.exercises
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @available_exercises = current_user.exercises
    @workout.workout_exercises.build
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout was successfully updated."
    else
      @available_exercises = current_user.exercises
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_url, notice: "Workout was successfully deleted."
  end

  private

  def set_workout
    @workout = current_user.workouts.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(
      :name,
      :description,
      :date,
      workout_exercises_attributes: [ :id, :exercise_id, :sets, :reps, :weight, :notes, :_destroy ]
    )
  end
end
