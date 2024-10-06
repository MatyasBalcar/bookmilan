class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :destroy]
  before_action :set_session, only: [:destroy]

  def index
    @sessions = Session.all
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

  def destroy
    @session.destroy
    redirect_to sessions_path, notice: 'Reservation was successfully destroyed.'
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:start_date, :end_date)
  end
end
