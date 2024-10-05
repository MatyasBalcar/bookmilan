class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    @sessions = current_user.sessions
  end

  def new
    @session = Session.new
  end

  def create
    @session = current_user.sessions.build(session_params)
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
