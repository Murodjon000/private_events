class EnrollmentsController < ApplicationController
  before_action :logged_in

  def create
    event = Event.find(params[:event_id])
    enrollment = Enrollment.new(event_id: event.id, user_id: params[:user_id])

    if enrollment.save
      enrollment.invited!
      flash[:success] = 'Invitation sent to user'
      redirect_to users_path(event_id: event.id)
    else
      flash[:alert] = 'Something went wrong...'
      redirect_to event_path(event)
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    enrollment = Enrollment.find(params[:id])
    if current_user == event.creator
      enrollment.destroy
      flash[:success] = 'Invitation removed'
    else
      enrollment.invited!
      flash[:alert] = 'Something went wrong...'
    end

    redirect_to users_path(event_id: event.id, id: enrollment.id)
  end
end
