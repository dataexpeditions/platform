class Admin::StudiesController < Admin::BaseController
  before_action :load_study, only: %i(edit update accept reject destroy edit_carousel_attributes put_in_carousel)

  def to_review
    @studies = Study.waiting_for_review
  end

  def accepted
    @studies = Study.accepted
  end

  def edit
  end

  def edit_carousel_attributes
    @study.in_carousel = true
  end

  def update
    if @study.update study_params
      redirect_to accepted_admin_studies_path
    else
      render 'edit'
    end
  end

  def put_in_carousel
    @study.in_carousel = true
    if @study.update carousel_params
      Study.where(in_carousel: true).where('id <> ?', @study.id).update_all(in_carousel: false)
      flash[:success] = "L'image à été placée dans le carousel."
      redirect_to edit_carousel_attributes_admin_study_path(@study)
    else
      render 'edit_carousel_attributes', status: :unprocessable_entity
    end
  end

  def accept
    @study.accept!
    redirect_to to_review_admin_studies_path
  end

  def reject
    @study.reject!
    redirect_to to_review_admin_studies_path
  end

  def destroy

  end

  protected

  def study_params
    params.require(:study).permit(:title, :category_id, :body, :github_url, :summary)
  end

  def carousel_params
    res = params.require(:study).permit(:carousel_image)
    res.delete(:carousel_image) if res[:carousel_image] == ''
    res
  end

  def load_study
    @study = Study.find(params[:id])
  end
end
