class EventAttendancesController < ApplicationController

  before_action :set_attended_event

  # POST /events/1
  # attended_event_id | attendee_id
  def create
    @attended_event = EventAttendance.new(event_params)

    respond_to do |format|
      if @attended_event.save
        format.html { redirect_to event_url(event_params[:attended_event_id]), notice: "Event attendance was successfully confirmed." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  def destroy
    EventAttendance.find_by(attended_event_id: event_params[:attended_event_id]).destroy
    respond_to do |format|
      format.html { redirect_to event_url(event_params[:attended_event_id]), notice: "Event attendance was successfully cancelled." }
    end
  end

  private
  # Set @attended_event
  def set_attended_event
    @attended_event = Event.find(event_params[:attended_event_id])
  end
    
  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event_attendance).permit(:attended_event_id, :attendee_id)
  end

end
