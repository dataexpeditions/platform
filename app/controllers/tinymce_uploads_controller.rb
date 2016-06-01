class TinymceUploadsController < ApplicationController
  def create
    @upload = TinymceUpload.new(image: params[:file])
    if @upload.save
      render json: { location: @upload.image.url }
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end
end
