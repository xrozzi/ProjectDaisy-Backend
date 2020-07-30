class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]
  before_action :set_user_id_param, only: [:create, :update]

  # GET all messages from a specific conversation
  def index
    @messages = Conversation.find(params[:conversation_id]).messages

    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:user_id, :conversation_id, :text)
    end

    def set_user_id_param       
        params[:message][:user_id] = current_user.id     
    end
end
