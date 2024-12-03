class WorkoutsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @workouts = Workout.all  
    end
  
    def new
      @workout = Workout.new  
    end
  
    def create
      @workout = Workout.new(workout_params)  
  
      if @workout.save
        redirect_to @workout, notice: 'Workout was successfully created.' 
      else
        render :new  
      end
    end
  
    def show
      @workout = Workout.find(params[:id])  
    end
  
    def edit
      @workout = Workout.find(params[:id])  
    end
  
    def update
      @workout = Workout.find(params[:id]) 
  
      if @workout.update(workout_params) 
        redirect_to @workout, notice: 'Workout was successfully updated.'  
      else
        render :edit 
      end
    end
  
    def destroy
      @workout = Workout.find(params[:id])  
      @workout.destroy  
  
      redirect_to workouts_url, notice: 'Workout was successfully destroyed.'  
    end
  
    private
  
    def workout_params
      params.require(:workout).permit(:name, :description, :muscle_group, :equipment, :category, :user_id)
    end
  end
  