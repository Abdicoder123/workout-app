class BmisController < ApplicationController
    before_action :set_bmi, only: %i[show edit update destroy]
    before_action :authenticate_user!
  

    def index
      @bmis = Bmi.where(user_id: current_user.id) 
    end
  
    def show
    end
  
    def new
      @bmi = Bmi.new
    end
  
    def edit
    end

    def create
      @bmi = Bmi.new(bmi_params)
      @bmi.user = current_user 
  
      if @bmi.save
        redirect_to @bmi, notice: 'BMI was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /bmis/1
    def update
      if @bmi.update(bmi_params)
        redirect_to @bmi, notice: 'BMI was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /bmis/1
    def destroy
      @bmi.destroy
      redirect_to bmis_url, notice: 'BMI was successfully destroyed.'
    end
  
    private
  
    def set_bmi
      @bmi = Bmi.find(params[:id])
      
      unless @bmi.user == current_user
        redirect_to bmis_path, alert: 'You are not authorized to view this BMI.'
      end
    end
  
    def bmi_params
      params.require(:bmi).permit(:height_ft, :height_in, :weight, :number, :category)
    end
  end
  