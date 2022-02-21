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

    new_admin_id = params[:group][:admin_id].to_i

    respond_to do |format|
      if @group.update(group_params)
        if new_admin_id != current_user.id
          demoted_admin = GroupMember.new({
              user_id: current_user.id, 
              group_id: @group.id
            })
          if demoted_admin.save
            flash[:demote_admin] = "You made a successful transition into a member of this group."
          else
            debugger
            flash[:admin_change_error] = "Sorry we weren't able change you into a member of this group due to an internal error."
          end

          new_admins_old_member_listing = GroupMember.where(user_id: new_admin_id).where(group_id: @group.id).first
          new_admin = User.find_by(id: new_admin_id)
          
          if new_admins_old_member_listing
            new_admins_old_member_listing.destroy
            debugger
            flash[:new_admin] = "#{new_admin.username} was promoted to admin of this group."
          end
        end
        format.html { redirect_to "/groups/#{@group.id}", notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { redirect_to "/groups/#{@group.id}", alert: @group.errors.full_messages.first }
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
    params.require(:group).permit(:group_name, :description, :admin_id )
  end
end
