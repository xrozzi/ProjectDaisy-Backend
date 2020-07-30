class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]

  # GET all current users conversations
  def index
    @conversations = current_user.conversations 

    render json: @conversations
  end

  # GET a conversation by an ID
  def show
    render json: @conversation
  end

  # POST create a new conversation
  def create
    @conversation = Conversation.new({title: conversation_params[:title]})
  
    if @conversation.save
      @conversation.users << User.find_by_email(conversation_params[:reciever_email])
      @conversation.users << current_user
      render json: @conversation, status: :created, location: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conversations/1
  def update
    if @conversation.update(conversation_params)
      render json: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversations/1
  def destroy
    @conversation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def conversation_params
      params.require(:conversation).permit(:title, :reciever_email)
    end

end
