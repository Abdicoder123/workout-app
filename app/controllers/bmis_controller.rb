class BmisController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bmis = Bmi.where(user_id: current_user.id) 
  end
  
  def new
    @bmi = Bmi.new  
  end
  
  def create
    @bmi = Bmi.create(bmi_params.merge(user_id: current_user.id))
    if @bmi.save
      redirect_to @bmi, notice: 'BMI record was successfully created.' 
    else
      puts @bmi.errors.full_messages 
      flash[:alert] = @bmi.errors.full_messages.to_sentence 
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @bmi = Bmi.find(params[:id])  
  end
  
  def edit
    @bmi = Bmi.find(params[:id])  
  end
  
  def update
    @bmi = Bmi.find(params[:id]) 
  
    if @bmi.update(bmi_params) 
      redirect_to @bmi, notice: 'BMI record was successfully updated.'  
    else
      render :edit 
    end
  end
  
  def destroy
    @bmi = Bmi.find(params[:id])  
    @bmi.destroy  
  
    redirect_to bmis_url, notice: 'BMI record was successfully destroyed.'  
  end
  
  private
  
  def bmi_params
    params.require(:bmi).permit(:height, :weight, :number, :category)
  end
end
