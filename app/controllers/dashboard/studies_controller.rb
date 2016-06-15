class Dashboard::StudiesController < Dashboard::BaseController
  before_action :load_study, only: %i(edit new update destroy duplicate submit_for_review)

  def index
    @studies = current_user.studies.order('deleted_at ASC, created_at DESC')
  end

  def edit
    authorize! :edit, @study
  end

  def create
    @study = current_user.studies.build study_params
    authorize! :create, @study
    if @study.save
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def update
    @study.assign_attributes study_params
    @study.last_edit_at = Time.now
    authorize! :update, @sutdy
    if @study.valid?
      @study.save
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, @study
    @study.update deleted_at: Time.now
    redirect_to action: :index
  end

  def duplicate
    authorize! :destroy, @study
    @new_study = @study.duplicate!
    redirect_to edit_dashboard_study_path(@new_study)
  end

  def submit_for_review
    authorize! :submit_for_review, @study
    @study.submit_for_review!
    redirect_to dashboard_studies_path
  end

  protected

  def study_params
    params.require(:study).permit(:title, :category_id, :body, :summary, :github_url)
  end

  def load_study
    @study = params[:id] && Study.find(params[:id]) || Study.new
  end
end
