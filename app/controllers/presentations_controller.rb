# Handles the user-facing actions for interacting with presentations
class PresentationsController < ApplicationController
  # User view
  def index
    if current_user.is_instructor
      redirect_to '/admin/presentations'
    end
    @presentation = Presentation.find_by(id: params[:id].to_i)
    
  end

  # Individual presentation view
  def details
    if current_user.is_instructor
      redirect_to "/admin/presentations/#{params[:id]}"
    end
    @presentation = Presentation.find_by(id: params[:id].to_i)
    @feedback = Feedback.new
  end

  # Submit feedback for a presentation with the given presentation_id
  def feedback
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
    unless current_user.id == params[:id]
      head 403
    end
    feedback = Feedback.find(params[:id])
    feedback.destroy
  end
end
