class MeasurementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_measurement, only: [:edit, :update, :destroy]

  def index
    @measurements = Measurement.all.order("date, timezone DESC")
  end

  def new
    @measurement = Measurement.new
  end

  def create
     @measurement = Measurement.create(measurement_params)
     if @measurement.save
       redirect_to measurements_path  
    else
      render :new
    end
  end


  def edit
    unless current_user == @measurement.user
      redirect_to root_path
    end
  end


  def update
    if @measurement.update(measurement_params)
      redirect_to measurements_path
    else
      render :edit
    end
  end
 
  def destroy
    if current_user.id == @measurement.user_id
      @measurement.destroy
    end
      redirect_to measurements_path
  end


private
  def measurement_params
    params.require(:measurement).permit(:date, :timezone, :value).merge(user_id: current_user.id)
  end

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

end