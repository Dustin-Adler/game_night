class AttendeesController < ApplicationController
  before_action :set_attendee, only: %i[show edit update destroy]

  def create
    @attendee = Attendee.new
    @attendee.event_id = params[:event_id]
    @attendee.user_id = current_user.id

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to "/events/#{params[:event_id]}", notice: 'You successfully RSVPd to the Event!' }
        format.json { render :show, status: :created, location: @attendee }
      else
        format.html { redirect_to "/events/#{params[:event_id]}", alert: @attendee.errors.full_messages.first }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendee.destroy

    respond_to do |format|
      format.html { redirect_to "/events/#{@attendee.event_id}}", notice: 'Your schedule was successfully updated.' }
      format.json { head :no_content }
    end
  end

  private

  def set_attendee
    @attendee = Attendee.find(params[:id])
  end
end
