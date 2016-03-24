class MainfeedsController < ApplicationController
  before_action :set_mainfeed, only: [:show, :edit, :update, :destroy]

  # GET /mainfeeds
  # GET /mainfeeds.json
  def index
    @mainfeeds = Mainfeed.all
  end

  # GET /mainfeeds/1
  # GET /mainfeeds/1.json
  def show
  end

  # GET /mainfeeds/new
  def new
    @mainfeed = Mainfeed.new
  end

  # GET /mainfeeds/1/edit
  def edit
  end

  # POST /mainfeeds
  # POST /mainfeeds.json
  def create
    @mainfeed = Mainfeed.new(mainfeed_params)

    respond_to do |format|
      if @mainfeed.save
        format.html { redirect_to @mainfeed, notice: 'Mainfeed was successfully created.' }
        format.json { render :show, status: :created, location: @mainfeed }
      else
        format.html { render :new }
        format.json { render json: @mainfeed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mainfeeds/1
  # PATCH/PUT /mainfeeds/1.json
  def update
    respond_to do |format|
      if @mainfeed.update(mainfeed_params)
        format.html { redirect_to @mainfeed, notice: 'Mainfeed was successfully updated.' }
        format.json { render :show, status: :ok, location: @mainfeed }
      else
        format.html { render :edit }
        format.json { render json: @mainfeed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mainfeeds/1
  # DELETE /mainfeeds/1.json
  def destroy
    @mainfeed.destroy
    respond_to do |format|
      format.html { redirect_to mainfeeds_url, notice: 'Mainfeed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mainfeed
      @mainfeed = Mainfeed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mainfeed_params
      params.fetch(:mainfeed, {})
    end
end
