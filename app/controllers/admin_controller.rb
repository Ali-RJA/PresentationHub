# Handles the administrator-side actions for interacting with presentations
class AdminController < ApplicationController
  # Admin view
  def index
    unless current_user.is_instructor?
      redirect_to '/presentations'
    end
  end

  # Admin individual presentation view
  def details
    unless current_user.is_instructor?
      redirect_to "/presentations/#{params[:id]}"
    end
    @presentation = Presentation.find_by(id: params[:id].to_i)
  end

  # Event creation view
  def create
    unless current_user.is_instructor?
      redirect_to '/presentations'
    end
  end

  # Handles updating of presentation
  def update_presentation
    unless current_user.is_instructor?
      head 403
    end
    presentation = Presentation.find_by(id: params[:id].to_i)
    if presentation.nil?
      head 404
    end
    presentation.topic = params[:presentation][:topic]
    presentation.date = params[:presentation][:date].to_datetime
    presentation.user_id = params[:presentation][:user_id].to_i

    if params[:presentation][:document].present?
      presentation.document = params[:presentation][:document]
    end

    if presentation.valid?
      presentation.save!
      redirect_to request.referrer, notice: 'Updated'
    else
      redirect_to request.referrer, alert: 'Invalid input; check the fields, and submit again.'
    end
  end

  #Submit feedback for a presentation with the given presentation_id
  def feedback
    unless current_user.is_instructor?
      head 403
    end
    result = Feedback.new(
      user_id: current_user.id,
      rating: params[:feedback][:rating].to_i,
      comments: params[:feedback][:comments],
      presentation_id: params[:id].to_i
    )

    if result.valid?
      result.save!
      redirect_to request.referrer, notice: 'Submitted'
    else
      redirect_to request.referrer, alert: 'Invalid input; check the fields, and submit again.'
    end
  end

  # This function handles deletion
  def delete_presentation
    presentation = Presentation.find(params[:id])
    presentation.destroy
    redirect_to "/", notice: 'Presentation deleted'
  end

  def delete_feedback
    feedback = Feedback.find(params[:id])
    feedback.destroy
    redirect_to request.referrer, notice: 'Feedback deleted'
  end
  
  # Handles posting of new event (where it goes when the submit button is pressed on the create view)
  def make_event
    unless current_user.is_instructor?
      head 403
    end
    result = Presentation.new(
      user_id: params[:presentation][:user_id].to_i,
      topic: params[:presentation][:topic],
      date: params[:presentation][:date].to_datetime,
      document: params[:presentation][:document]
    )

    if result.valid?
      result.save!
      redirect_to "/presentations/#{result.id}"
    else
      redirect_to request.referrer, alert: 'Invalid input; check the fields, and submit again.'
    end
  end
end
