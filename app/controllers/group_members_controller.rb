class GroupMembersController < ApplicationController
  before_action :set_group_member, only: %i[show edit update destroy]

  def create
    @group_member = GroupMember.new(group_member_params)

    if @group_member.save
      redirect_to "/groups/#{@group_member.group_id}", notice: 'New member was successfully added to group.'
    else
      redirect_to "/groups/#{@group_member.group_id}", alert: @group_member.errors.full_messages.first
    end
  end

  def update
    respond_to do |format|
      if @group_member.update(group_member_params)
        format.html { redirect_to group_member_url(@group_member), notice: 'Group member was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group_member.destroy

    respond_to do |format|
      format.html { redirect_to "/groups/#{@group_member.group_id}", notice: 'Group member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_group_member
    @group_member = GroupMember.find(params[:id])
  end

  def group_member_params
    params.require(:group_member).permit(:group_id, :user_id)
  end
end
