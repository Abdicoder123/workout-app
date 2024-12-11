class WorkoutsController < ApplicationController
    before_action :authenticate_user!

    def index
      @workouts = Workout.where(user_id: current_user.id)
    end

    def new
      @workout = Workout.new
    end

    def create
      @workout = Workout.new(workout_params.merge(user_id: current_user.id))

      if @workout.save
        respond_to do |format|
          format.html do
            redirect_to @workout, notice: "Workout was successfully created."
          end
          format.json do
            render json: { message: "Workout created successfully!", workout: @workout }, status: :created
          end
        end
      else
        respond_to do |format|
          format.html do
            puts @workout.errors.full_messages
            render :new, status: :unprocessable_entity
          end
          format.json do
            render json: { errors: @workout.errors.full_messages }, status: :unprocessable_entity
          end
        end
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
        redirect_to @workout, notice: "Workout was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @workout = Workout.find(params[:id])
      @workout.destroy

      redirect_to workouts_url, notice: "Workout was successfully destroyed."
    end

    private

    def workout_params
      params.require(:workout).permit(:name, :description, :muscle_group, :equipment, :category)
    end
end
