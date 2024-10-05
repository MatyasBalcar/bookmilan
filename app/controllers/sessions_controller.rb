class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if @session.save
      redirect_to sessions_path, notice: 'Reservation created successfully.'
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:start_date, :end_date)
  end
end
