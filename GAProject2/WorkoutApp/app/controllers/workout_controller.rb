class WorkoutController < ApplicationController

  #This works - shows individual users workouts. 
  def index
    if current_user.present?
      @workout = Workout.where(user_id: current_user.id)
    else
      @workout = Workout.all
    end
  end

  def show
    
    @workout = Workout.where(id: params[:id])

  end

  def edit
  end

  def create
    @new_workout = Workout.create(user_id: current_user.id, :name => params[:workout][:name]); 
    params[:workout][:f_ids].each do |i|
      @new_workout.exercises << Exercise.find(i)
    end 

    redirect_to "/workout/current_user.id" 
  end

  def delete
  end

  def update
  end

  def new
    @workout = Workout.new
    @exercises = Exercise.all

  end
end

private 
def user_params

  params.require(:workout).permit(:user_id, :name, {exercise_ids:[]}, :id, :workout_id)

end
