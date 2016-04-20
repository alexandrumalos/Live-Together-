class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def is_lead(user, neighborhood)
    if neighborhood.leads.include?(user)
      true
    else
      false
    end
  end

  def update_lead_status(user, neighborhood, increase)
    if user.score.nil?
      user.score = 0
    end
    user.score = user.score + increase
    unless neighborhood.leads.include?(user)
      if neighborhood.threshold.nil?
        neighborhood.threshold = 100
      end
      if user.score >= neighborhood.threshold
        user.lead_neighborhoods << neighborhood
        neighborhood.leads << user
      end
    else
      user.lead_neighborhoods.delete(neighborhood)
      neighborhood.leads.delete(user)
    end

    user.save!
    neighborhood.save!
  end

  def isNewser(user)
    if user.user_type == 'newser'
      true
    else
      false
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :name) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me, :name) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :name) }
    end
end
