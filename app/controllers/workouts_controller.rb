class WorkoutsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @workouts = Workout.where(user_id: current_user.id) 
    end
  
    def new
      @workout = Workout.new  
    end
  
    def create
        #To make sure that the users logged in have their user_id collected
        @workout = Workout.create(workout_params.merge(user_id: current_user.id))
      if @workout.save
        redirect_to @workout, notice: 'Workout was successfully created.' 
      else
        # To display the error
        puts @workout.errors.full_messages 

        render :new, status: :unprocessable_entity
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
      params.require(:workout).permit(:name, :description, :muscle_group, :equipment, :category)
    end
  end
  