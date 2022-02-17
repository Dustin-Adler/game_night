class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show edit update destroy]

  def show
    @group_member = GroupMember.new
    @group_member.group_id = params[:id]
    @friends = Friend.get_friends(current_user)
    @current_user = current_user
    @event = Event.new
    @events = Group.find_by(id: params[:id]).events
    @games = Game.all.pluck(:game_name, :id)
  end

  def edit; end

  def create
    @group = Group.new(group_params)
    @group.admin_id = current_user.id

    if @group.save
      redirect_to dashboards_path, notice: 'Group was successfully created.'
    else
      redirect_to dashboards_path, alert: @group.errors.full_messages.first
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to dashboards_url, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { redirect_to dashboards_url, alert: @group.errors.full_messages.first }
        format.json { render json: @group.errors }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    if @group.destroy
      redirect_to dashboards_path, notice: 'group was successfully deleted.'
    else
      redirect_to dashboards_path, alert: @group.errors.full_messages
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:group_name, :description)
  end
end
