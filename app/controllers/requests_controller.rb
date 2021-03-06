# == Schema Information
#
# Table name: requests
#
#  id              :integer          not null, primary key
#  date            :date
#  type            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  neighborhood_id :integer
#

class RequestsController < ApplicationController

  before_action :set_request, only: [:show, :edit, :update, :destroy, :approve]
  before_action :authenticate_user!


  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  def approve
    neighborhood = @request.neighborhood
    if is_lead(current_user, neighborhood)
      request_type = @request.request_type
      if request_type == 'join'
        neighborhood.users << @request.user
        @request.destroy
      elsif request_type == 'event'
        @request.event.status = 'accepted'
        @request.event.save!
        @request.destroy
      end
    end

    respond_to do |format|
      format.html { redirect_to neighborhood, notice: 'Request approved' }
    end
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.user = current_user

    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_url, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { redirect_to requests_url }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    neighborhood = @request.neighborhood
    if is_lead(current_user, neighborhood)
      request_type = @request.request_type
      if request_type == 'event'
        @request.event.destroy
      end
      @request.destroy
    end

    respond_to do |format|
      format.html { redirect_to neighborhood, notice: 'Request denied' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:date, :request_type, :neighborhood_id)
    end
end
