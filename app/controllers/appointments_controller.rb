class AppointmentsController < ApplicationController

  def index
    data = Appointment.all.map{|x| [x.patient.name, x.doctor.name, x.diseases]}
    render json: {data: data}
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: { status: true, message: 'Successfully created..!' }
    else
      render json: { status: false, message: 'Something went wrong..!' }
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :diseases)
  end

end