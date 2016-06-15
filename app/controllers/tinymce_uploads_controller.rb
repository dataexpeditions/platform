class TinymceUploadsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @upload = TinymceUpload.new(user: current_user, image: params[:file])
    if @upload.save
      render json: { location: @upload.image.url }
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end
end
