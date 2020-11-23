class MeasurementsController < ApplicationController
  
  def index
    @measurements = Measurement.all
  end

  def new
    @measurement = Measurement.new
  end

  def create
     @measurement = Measurement.create(measurement_params)
    if @measurement.save
       redirect_to root_path   #再考予定
    else
      render "new"
    end
    # render json:{ measurement: measurement }
  end

private
  def measurement_params
    params.require(:measurement).permit(:date, :timezone, :value).merge(user_id: current_user.id)
  end
end
