class Dashboard::ProfilesController < Dashboard::BaseController
  before_action :load_user

  def show
  end

  def update
    if @user.update profile_params
      redirect_to action: :show
    else
      render 'show', status: :unprocessable_entity
    end
  end

  protected

  def load_user
    @user = current_user
  end

  def profile_params
    params.require(:user).permit(:name, :avatar)
  end
end
