class ImagesController < ApplicationController
    before_action :set_image, only: [:update, :destroy]

    # PUT - create an image
    def create 
        upload = Cloudinary::Uploader.upload(params[:image])
        image = Image.create(image: image["url"])
        render json: item
    end

    # PATCH - updates an existing image
    def update

    end

    # DELETE - deletes an image
    def destroy
        @image.Cloudinary::Uploader.destroy(id)
    end

    private

        def set_image
            @image = Message.find(params[:id])
        end

end
