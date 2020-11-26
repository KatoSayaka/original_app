class MealRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meal_record, only: [:edit, :update, :destroy]


  def new
    if user_signed_in?
      @meal_record = MealRecord.new
    else 
      redirect_to user_session_path
    end
  end

  def index
    @meal_records = MealRecord.all.order("date DESC")
  end

  def create
    @meal_record = MealRecord.new(meal_record_params)
    if @meal_record.save
      redirect_to meal_records_path 
    else
      render :new
    end
  end

  def edit
    unless current_user == @meal_record.user
      redirect_to root_path
     end
  end

  def update
    if @meal_record.update(meal_record_params)
      redirect_to meal_records_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @meal_record.user_id
      @meal_record.destroy
    else
      redirect_to  meal_records_path 
    end
  end

  private
  def meal_record_params
    params.require(:meal_record).permit(:date, :meal_as, :medicine, :content, :image).merge(user_id: current_user.id)
  end

  def set_meal_record
    @meal_record = MealRecord.find(params[:id])
  end

end
