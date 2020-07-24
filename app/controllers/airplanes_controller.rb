class AirplanesController < ApplicationController
  before_action :set_airplane, only: [:show, :edit, :update, :destroy]

  # GET /airplanes
  # GET /airplanes.json
  def index
    if params[:name]
      @airplanes = Airplane.company_name(params[:name])
    elsif params[:registration]
      @airplanes = Airplane.airplaneU(params[:registration])
    elsif params[:model]
      @airplanes = Airplane.where("model LIKE ?", "%#{params[:model]}%")
    else
      @airplanes = Airplane.all
    end
  end

  # GET /airplanes/1
  # GET /airplanes/1.json
  def show
  end

  # GET /airplanes/new
  def new
    @airplane = Airplane.new
  end

  # GET /airplanes/1/edit
  def edit
  end

  # POST /airplanes
  # POST /airplanes.json
  def create
    @airplane = Airplane.new(airplane_params)

    respond_to do |format|
      if @airplane.save
        format.html { redirect_to @airplane, notice: 'Airplane was successfully created.' }
        format.json { render :show, status: :created, location: @airplane }
      else
        format.html { render :new }
        format.json { render json: @airplane.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airplanes/1
  # PATCH/PUT /airplanes/1.json
  def update
    respond_to do |format|
      if @airplane.update(airplane_params)
        format.html { redirect_to @airplane, notice: 'Airplane was successfully updated.' }
        format.json { render :show, status: :ok, location: @airplane }
      else
        format.html { render :edit }
        format.json { render json: @airplane.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airplanes/1
  # DELETE /airplanes/1.json
  def destroy
    count = 0
    for s in Flight.all
      if s.airplane = @airplane
        count = count +1
      end
    end
    if count == 0
      @airplane.destroy
      respond_to do |format|
        format.html { redirect_to airplanes_url, notice: 'Airplane was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to vehicles_url, notice: "Airplane wasn't successfully destroyed because it's related to one or more flights" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airplane
      @airplane = Airplane.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def airplane_params
      params.require(:airplane).permit(:model, :registration, :seatings, :company_id)
    end
end
