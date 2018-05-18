class DoctorsController < ApplicationController

  def create
    doctor = Doctor.new(doctor_params)
    if doctor.save
      render json: { status: true, message: 'Successfully created..!' }
    else
      render json: { status: false, message: 'Something went wrong..!' }
    end
  end

  def index
    render json: {data: Doctor.pluck(:id, :name)}
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :phone_no, :specialization)
  end

end