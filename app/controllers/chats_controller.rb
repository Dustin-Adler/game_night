class ChatsController < ApplicationController
  before_action :set_chat, only: %i[show edit update destroy]

  def create
    @chat = Chat.new(chat_params)
    @chat.author_id = current_user.id
    @chat.event_id = params[:event_id]

    respond_to do |format|
      if @chat.save
        format.html { redirect_to "/events/#{@chat.event_id}", notice: 'Chat posted successfully' }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { redirect_to "/events/#{@chat.event_id}", alert: @chat.errors.full_messages }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to chat_url(@chat), notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to "/events/#{@chat.event_id}", notice: 'Comment/chat was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:comment)
  end
end
