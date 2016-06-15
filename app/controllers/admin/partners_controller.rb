class Admin::PartnersController < Admin::BaseController
  before_action :load_partner, only: %i(edit update destroy)

  def index
    @partners = Partner.all
  end

  def edit
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new partner_params
    if @partner.save
      flash[:success] = "Le partenaire à bien été ajouté."
      redirect_to admin_partners_path
    else
      render 'new'
    end
  end

  def update
    if @partner.update partner_params
      redirect_to admin_partners_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @partner.destroy!
    flash[:success] = "Le partenaire à été supprimé avec succès."
    redirect_to admin_partners_path
  end

  protected

  def partner_params
    res = params.require(:partner).permit(:name, :logo, :website_url, :description)
    res.delete(:logo) if res[:logo] == ''
    res
  end

  def load_partner
    @partner = Partner.find(params[:id])
  end
end
