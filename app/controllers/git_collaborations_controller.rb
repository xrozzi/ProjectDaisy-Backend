class GitCollaborationsController < ApplicationController
  before_action :authenticate_user
  # set a user before they create or update a collab
  before_action :set_user_id_param, only: [:create, :update]
  # set a collaboration to be shown, updated or destroyed
  before_action :set_git_collaboration, only: [:show, :update, :destroy]

  # GET all created user collaborations
  def index
    @git_collaborations = GitCollaboration.all

    render json: @git_collaborations
  end

  # GET get a collaboration by its ID
  def show
    render json: @git_collaboration
  end

  # POST /git_collaborations
  def create
    @git_collaboration = GitCollaboration.new(git_collaboration_params)

    # if git collaboration is saved return the git collaboration
    if @git_collaboration.save
      render json: @git_collaboration, status: :created, location: @git_collaboration
    #  return error if not created
    else
      render json: @git_collaboration.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /git_collaborations/1
  def update
    if @git_collaboration.update(git_collaboration_params)
      render json: @git_collaboration
    else
      render json: @git_collaboration.errors, status: :unprocessable_entity
    end
  end

  # DELETE /git_collaborations/1
  def destroy
    @git_collaboration.destroy
  end

  #Retrieve all current users git collaborations
  def user_collabs
    begin
      if current_user.git_collaborations
        render json: current_user.git_collaborations.all
      end
    rescue
      render json: current_user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_git_collaboration
      @git_collaboration = GitCollaboration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def git_collaboration_params
      params.require(:git_collaboration).permit(:title, :description, :user_id)
    end

    #set a user by params
    def set_user_id_param
      params[:git_collaboration][:user_id] = current_user.id
    end

end
