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
  before_action :set_neighborhood, only: [:show, :edit, :update, :destroy, :set_active]
  before_action :authenticate_user!

  # GET /neighborhoods
  # GET /neighborhoods.json
  def index
    @neighborhoods = Neighborhood.all
  end

  # GET /neighborhoods/1
  # GET /neighborhoods/1.json
  def show
  end

  # GET /neighborhoods/new
  def new
    @neighborhood = Neighborhood.new
  end

  # GET /neighborhoods/1/edit
  def edit
  end

  # POST /neighborhoods
  # POST /neighborhoods.json
  def create
    @neighborhood = Neighborhood.new(neighborhood_params)
    @neighborhood.threshold = 100
    @neighborhood.leads << current_user
    current_user.lead_neighborhoods << @neighborhood

    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to @neighborhood, notice: 'Neighborhood was successfully created.' }
        format.json { render :show, status: :created, location: @neighborhood }
      else
        format.html { render :new }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neighborhoods/1
  # PATCH/PUT /neighborhoods/1.json
  def update

    @neighborhood = Neighborhood.find(params[:id])
    @user = User.find(params[:user_id])
    !neighborhood.users.find(@user)
    @neighborhood.users << @user unless @neighborhood.users.include? @user

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

  def update
      @group = Group.find(params[:id])
      @user = User.find(params[:user_id])
      if !@group.users.find(@user)
          @group.users << @user
      end
    end
  # DELETE /neighborhoods/1
  # DELETE /neighborhoods/1.json
  def destroy
    @neighborhood.destroy
    respond_to do |format|
      format.html { redirect_to neighborhoods_url, notice: 'Neighborhood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_active
    current_user.current_neighborhood = @neighborhood

    respond_to do |format|
      if current_user.save
        format.html { redirect_to posts_url, notice: 'Neighborhood has been visited' }
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
      params.require(:neighborhood).permit(:name, :location, :description)
    end
end
