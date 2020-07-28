class ImagesController < ApplicationController
    
    before_action :set_image, only: [:update, :destroy]

    # PUT - create an image
    def create 
        upload = Cloudinary::Uploader.upload(params[:image])
        image = Image.create(image: upload["url"], user_id: current_user["id"])
        puts current_user
        render json: image
    end

    # PATCH - updates an existing image
    def update

        if @image.update(image: image["url"])
            render json: @image
          else
            render json: @image.errors, status: :unprocessable_entity
          end

    end

    # DELETE - deletes an image
    def destroy
        @image.Cloudinary::Uploader.destroy(:id)
        @image.destroy
    end

    private

        def set_image
            @image = Message.find(params[:id])
        end

end
