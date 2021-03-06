class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET user object with attached image and git collaborations
  def show
    puts @user.git_collaborations
    begin
      if @user.image
        render json: @user.as_json.merge(image: Image.find_by_user_id(@user.id).image, git_collaborations: @user.git_collaborations)
      end
      # if no attached image return user object (if no collabs empty array returned)
    rescue
    render json: @user.as_json.merge(git_collaborations: @user.git_collaborations)
    
    end

  end

  # POST create a new user
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # method for front end to retrieve object of current user
  def methodlol
    begin
      if current_user.image
        render json: current_user.as_json.merge(image: Image.find_by_user_id(current_user.id).image)
      end
    rescue
    render json: current_user
    
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :firstname, :lastname)
    end
    
end
