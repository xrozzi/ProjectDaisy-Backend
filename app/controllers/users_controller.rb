class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    begin
      if @user.image
        render json: @user.as_json.merge(image: Image.find_by_user_id(@user.id).image)
      end
    rescue
    render json: @user
    
    end
    
    # render json: @user
  end

  # POST /users
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

  def methodlol
    begin       
      if current_user.image  
      render json: current_user.as_json.merge(image: Image.find_by_user_id(current_user.id).image)    
     end  
       rescue    
         render json: current_user      
         end

    # if current_user
    #   render json: current_user

    # else
    #   render json: {}, status: :unprocessable_entity
    # end
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
