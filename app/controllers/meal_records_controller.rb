class MealRecordsController < ApplicationController

  def new
    @meal_record = MealRecord.new
  end

  def index
    @meal_records = MealRecord.all
  end

  def create
    @meal_record = MealRecord.new(meal_record_params)
    if @meal_record.save
      redirect_to meal_records_path  #再考予定
    else
      render :new
    end
  end

  def edit
    @meal_record = MealRecord.find(params[:id])
  end

  def update
    meal_record = MealRecord.find(params[:id])
    if meal_record.update(meal_record_params)
      redirect_to meal_records_path
    else
      render :edit
    end
  end

  def destroy
    meal_record = MealRecord.find(params[:id])
    meal_record.destroy
    redirect_to  meal_records_path 
  end

  private
  def meal_record_params
    params.require(:meal_record).permit(:date, :meal_as, :content, :image)
  end
end
