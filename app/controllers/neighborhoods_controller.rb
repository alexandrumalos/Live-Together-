# == Schema Information
#
# Table name: neighborhoods
#
#  id          :integer          not null, primary key
#  name        :string
#  location    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: [:show, :edit, :update, :destroy, :set_active, :request_to_join, :leave, :remove_user, :visit]
  before_action :authenticate_user!

  # GET /neighborhoods
  # GET /neighborhoods.json
  def index
    @neighborhoods = Neighborhood.all
  end

  def remove_user
    user = User.find_by(id: params[:user_id])
    @neighborhood.users.delete(user)
    if is_lead(user, @neighborhood) && current_user.user_type != 'admin'
      @neighborhood.leads.delete(user)
      if @neighborhood.leads.count < 1
        @neighborhood.destroy
      end
    end

    respond_to do |format|
      format.html { redirect_to neighborhoods_url, notice: 'User has been removed' }
      format.json { render :show, status: :created, location: @neighborhood }
    end
  end

  # GET /neighborhoods/1
  # GET /neighborhoods/1.json
  def show
    if @neighborhood.users.include?(current_user)
      current_user.current_neighborhood = @neighborhood
      current_user.save!
    end
    @category = Category.new
  end

  def visit
    if @neighborhood.users.include?(current_user)
      current_user.current_neighborhood = @neighborhood
      current_user.save!

      respond_to do |format|
        format.html { redirect_to posts_url }
      end
    else
      respond_to do |format|
        format.html { redirect_to neighborhoods_url }
      end
    end
  end

  # GET /neighborhoods/new
  def new
    @neighborhood = Neighborhood.new
    unless params[:id].nil?
      @parent = Neighborhood.find(params[:id])
    end
    if isNewser(current_user)
      respond_to do |format|
        format.html { redirect_to neighborhoods_url, notice: 'Newsers cannot create neighborhoods' }
      end
    end
  end

  # GET /neighborhoods/1/edit
  def edit
  end

  def leave
    @neighborhood.users.delete(current_user)
    if is_lead(current_user, @neighborhood) && current_user.user_type != 'admin'
      @neighborhood.leads.delete(current_user)
      if @neighborhood.leads.count == 0
        @neighborhood.destroy
      end
    elsif @neighborhood.users.count == 0
      @neighborhood.destroy
    end

    respond_to do |format|
      format.html { redirect_to neighborhoods_url, notice: 'You have left the neighborhood "' + @neighborhood.name + '".' }
      format.json { render :show, status: :created, location: @neighborhood }
    end
  end

  # POST /neighborhoods
  # POST /neighborhoods.json
  def create
    @neighborhood = Neighborhood.new(neighborhood_params)
    if @neighborhood.threshold.nil?
      @neighborhood.threshold = 100
    end
    @neighborhood.users << current_user
    @neighborhood.leads << current_user
    misc = Category.new()
    misc.name = 'Miscellaneous'
    misc.description = 'Default Category'
    @neighborhood.categories << misc
    if @neighborhood.save
      set_active
    else
      respond_to do |format|
        format.html { redirect_to neighborhoods_url }
      end
    end
    # respond_to do |format|
    #   if @neighborhood.save
    #     format.html { redirect_to @neighborhood, notice: 'Neighborhood was successfully created.' }
    #     format.json { render :show, status: :created, location: @neighborhood }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /neighborhoods/1
  # PATCH/PUT /neighborhoods/1.json

  def update
    respond_to do |format|
      if @neighborhood.update(neighborhood_params)
        format.html { redirect_to @neighborhood, notice: 'Neighborhood was successfully updated.' }
        format.json { render :show, status: :ok, location: @neighborhood }
      else
        format.html { render :edit }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #     @group = Group.find(params[:id])
  #     @user = User.find(params[:user_id])
  #     if !@group.users.find(@user)
  #         @group.users << @user
  #     end
  #   end
  # DELETE /neighborhoods/1
  # DELETE /neighborhoods/1.json
  def destroy
    @neighborhood.destroy
    respond_to do |format|
      format.html { redirect_to neighborhoods_url, notice: 'Neighborhood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def join
  #   @neighborhood.users << current_user unless @neighborhood.users.include?(current_user)
  #   set_active
  # end

  # POST /neighborhoods/1/request_to_join
  def request_to_join
    unless user_pending(current_user)
      @request = Request.new
      @request.user = current_user
      @request.neighborhood = @neighborhood
      @request.request_type = 'join'

      respond_to do |format|
        if @request.save
          format.html { redirect_to @neighborhood, notice: 'Request was successfully created.' }
          format.json { render :show, status: :created, location: @request }
        else
          format.html { render :new }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @neighborhood, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      end
    end
  end

  def set_active
    if @neighborhood.users.include?(current_user)
      current_user.current_neighborhood = @neighborhood
    end

    respond_to do |format|
      if current_user.save
        format.html { redirect_to @neighborhood, notice: 'Neighborhood has been visited' }
        format.json { render :show, status: :created, location: @neighborhood }
      else
        format.html { redirect_to @neighborhood, notice: 'Neighborhood could not be visited' }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighborhood
      @neighborhood = Neighborhood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neighborhood_params
      params.require(:neighborhood).permit(:name, :location, :description, :threshold, :parent_id, :image_url)
    end

    def user_pending(user)
      if Request.find_by(user_id: user.id, request_type: 'join').nil?
        false
      else
        true
      end
    end
end
