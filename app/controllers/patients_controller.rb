class PatientsController < ApplicationController

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      render json: {status: true, message: 'Patient created successfully'}
    else
      render json: {status: false, message: 'Something went wrong..!'}
    end
  end

  def index
    render json: {data: Patient.pluck(:id, :name)}
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :phone_no)
  end

end