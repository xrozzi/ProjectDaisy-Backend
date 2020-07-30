class ImagesController < ApplicationController
    
    before_action :set_image, only: [:update, :destroy]

    # PUT - create an image
    def create 
        uploaded_image = params[:image]
        # save image to cloudinary
        upload = Cloudinary::Uploader.upload(params[:image])
        # save uploaded url in the images table with attached user id
        image = Image.create(image: upload["url"], user_id: current_user.id)
        render json: image
    end

    # PATCH - updates an existing image
    def update
        # update image image url
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
