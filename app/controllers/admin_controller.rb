class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.user_type != 'admin'
      respond_to do |format|
        format.html { redirect_to root_url }
      end
    end

    @users = User.all.order(:name)
    @user_count = @users.count
    @users = @users.paginate(page: params[:user_page], per_page:20)

    @neighborhoods = Neighborhood.all.order(:name)
    @neighborhood_count = @neighborhoods.count
    @neighborhoods = @neighborhoods.paginate(page: params[:neighborhood_pag], per_page:20)
  end
end
