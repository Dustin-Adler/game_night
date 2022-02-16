class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
  end

  def show
    @chat = Chat.new
    @chats = @event.chats.includes(:author)
    @group = @event.group
    @game = @event.game
    @attendee = Attendee.new
    @attendees = @event.attendees.pluck(:username)
    @current_user = current_user 
    @attending = Attendee.where(user_id: current_user.id).where(event_id: @event.id)

  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    game_id = params[:event][:game_id]
    game = Game.find_by(game_name: game_id)
    @event.game_id = game.id if game
    @event = Event.new(event_params)
    @event.group_id = params[:group_id]
    @event.author_id = current_user.id
    @event.admin_id = params[:admin_id].to_i

    respond_to do |format|
      if @event.save
        format.html { redirect_to "/groups/#{params[:group_id]}", notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to "/groups/#{params[:group_id]}", alert: @event.errors.full_messages }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private 

    def set_event
      @event = Event.find(params[:id])
    end 

    def event_params
      params.require(:event).permit( :game_id, :required_players, :details, :date, :admin_id, :title )
    end
end
