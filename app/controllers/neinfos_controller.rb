class NeinfosController < ApplicationController
  before_action :set_neinfo, only: [:show, :edit, :update, :destroy]

  # GET /neinfos
  # GET /neinfos.json
  def index
    @neinfos = Neinfo.all
  end

  # GET /neinfos/1
  # GET /neinfos/1.json
  def show
  end

  # GET /neinfos/new
  def new
    @neinfo = Neinfo.new
  end

  # GET /neinfos/1/edit
  def edit
  end

  # POST /neinfos
  # POST /neinfos.json
  def create
    @neinfo = Neinfo.new(neinfo_params)

    respond_to do |format|
      if @neinfo.save
        format.html { redirect_to @neinfo, notice: 'Neinfo was successfully created.' }
        format.json { render :show, status: :created, location: @neinfo }
      else
        format.html { render :new }
        format.json { render json: @neinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neinfos/1
  # PATCH/PUT /neinfos/1.json
  def update
    respond_to do |format|
      if @neinfo.update(neinfo_params)
        format.html { redirect_to @neinfo, notice: 'Neinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @neinfo }
      else
        format.html { render :edit }
        format.json { render json: @neinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neinfos/1
  # DELETE /neinfos/1.json
  def destroy
    @neinfo.destroy
    respond_to do |format|
      format.html { redirect_to neinfos_url, notice: 'Neinfo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neinfo
      @neinfo = Neinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neinfo_params
      params.fetch(:neinfo, {})
    end
end
