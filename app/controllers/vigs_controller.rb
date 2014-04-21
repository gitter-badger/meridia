class VigsController < ApplicationController
  before_action :set_vig, only: [:show, :edit, :update, :destroy]

  # GET /vigs
  # GET /vigs.json
  def index
    @vigs = Vig.all
  end

  # GET /vigs/1
  # GET /vigs/1.json
  def show
  end

  # GET /vigs/new
  def new
    @vig = Vig.new
  end

  # GET /vigs/1/edit
  def edit
  end

  # POST /vigs
  # POST /vigs.json
  def create
    @vig = Vig.new(vig_params)

    respond_to do |format|
      if @vig.save
        format.html { redirect_to @vig, notice: 'Vig was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vig }
      else
        format.html { render action: 'new' }
        format.json { render json: @vig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vigs/1
  # PATCH/PUT /vigs/1.json
  def update
    respond_to do |format|
      if @vig.update(vig_params)
        format.html { redirect_to @vig, notice: 'Vig was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vigs/1
  # DELETE /vigs/1.json
  def destroy
    @vig.destroy
    respond_to do |format|
      format.html { redirect_to vigs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vig
      @vig = Vig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vig_params
      params.require(:vig).permit(:name, :date)
    end
end
