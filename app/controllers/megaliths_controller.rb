class MegalithsController < ApplicationController
  before_action :set_megalith, only: %i[ show edit update destroy ]

  # GET /megaliths or /megaliths.json
  def index
    @megaliths = Megalith.all
  end

  # GET /megaliths/1 or /megaliths/1.json
  def show
  end

  # GET /megaliths/new
  def new
    @megalith = Megalith.new
  end

  # GET /megaliths/1/edit
  def edit
  end

  # POST /megaliths or /megaliths.json
  def create
    @megalith = Megalith.new(megalith_params)

    respond_to do |format|
      if @megalith.save
        format.html { redirect_to @megalith, notice: "Megalith was successfully created." }
        format.json { render :show, status: :created, location: @megalith }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @megalith.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /megaliths/1 or /megaliths/1.json
  def update
    respond_to do |format|
      if @megalith.update(megalith_params)
        format.html { redirect_to @megalith, notice: "Megalith was successfully updated." }
        format.json { render :show, status: :ok, location: @megalith }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @megalith.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /megaliths/1 or /megaliths/1.json
  def destroy
    @megalith.destroy
    respond_to do |format|
      format.html { redirect_to megaliths_url, notice: "Megalith was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_megalith
      @megalith = Megalith.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def megalith_params
      params.require(:megalith).permit(:name, :address, :city, :category, :description, :latitude, :longitude)
    end
end
