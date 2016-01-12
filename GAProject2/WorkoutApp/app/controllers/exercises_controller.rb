class ExercisesController < ApplicationController

  def index
    if params[:user_id].present?
      @exercise = Exercise.where(user_id: current_user.id)
    else
      @exercise = Exercise.all
    end
  end

  def show
    @exercise = Exercise.where(user_id: params[:user_id])
    @workout = Workout.where(user_id: params[:user_id])
  end

  def edit
    @exercise = Exercise.find(params[:id])
    puts @exercise
  end

  def create
    @new_exercise = Exercise.new(:bodypart => params[:exercise][:bodypart], :content => params[:exercise][:content], :comments => params[:exercise][:comments], creator: current_user.id)
    
    if @new_exercise.save
      redirect_to action: "index"
    end
  end 


  def destroy
    Exercise.destroy(params[:id])
    redirect_to action: "index"   

  end

  def update

    @exercise = Exercise.find(params[:id])
    @exercise.update(:bodypart => params[:exercise][:bodypart], :content => params[:exercise][:content], :comments => params[:exercise][:comments], creator: current_user.id)
    redirect_to action: "index"
  end

  def new

    @exercise = Exercise.new

  end

  private 
  def user_params
    params.require(:exercises).permit(:bodypart, :content, :comments, :creator)
  end

end
