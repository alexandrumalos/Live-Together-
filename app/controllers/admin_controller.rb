class AdminController < ApplicationController
  before_action :authenticate_user!

  def index

    @users = User.all

    # if current_user.user_type != 'admin'
    #   respond_to do |format|
    #     format.html { redirect_to root_url }
    #   end
    # end
 end
end
