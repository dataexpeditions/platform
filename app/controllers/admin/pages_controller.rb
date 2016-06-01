class Admin::PagesController < Admin::BaseController
  before_action :load_page

  def edit
  end

  def update
    if @page.update params.require(:page).permit(:body)
      flash[:success] = "La page à bien été modifié"
      redirect_to edit_admin_page_path(@page.slug)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  protected

  def load_page
    if params[:id] =~ /^\d+$/
      @page = Page.find(params[:id])
    else
      @page = Page.find_by(slug: params[:id])
    end
  end
end
