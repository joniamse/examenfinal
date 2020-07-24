class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    if params[:from] && params[:to]
      @flights = Flight.filterdate(params[:from] , params[:to])
    elsif params[:company_id]
      @flights = Flight.filterCompany(params[:company_id]) 
    elsif params[:registration]
      @flights = Flight.airplane_patent(params[:registration])  
    elsif params[:airport]
      @flights = Flight.where("airport LIKE ?", "%#{params[:airport]}%")
    elsif params[:name]
      @flights = Flight.where("name LIKE ?", "%#{params[:name]}%") 
    else
      @flights = Flight.all
    end
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
    @state_code = ["Demorado" , "Aterrizado", "A tiempo"]
  end

  # GET /flights/1/edit
  def edit
    @state_code = ["Demorado" , "Aterrizado", "A tiempo"]
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)
    @state_code = ["Demorado" , "Aterrizado", "A tiempo"]

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    @state_code = ["Demorado" , "Aterrizado", "A tiempo"]
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:departure_date, :arrival_date, :arrival, :name, :state_code, :departure_place, :arrival_place, :airport, :airplane_id)
    end
end
