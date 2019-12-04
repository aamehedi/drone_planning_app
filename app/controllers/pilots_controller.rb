class PilotsController < ApplicationController
  before_action :set_pilot, only: [:show, :edit, :update, :destroy]

  # GET /pilots
  def index
    @pilots = Pilot.all
  end

  # GET /pilots/1
  def show
  end

  # GET /pilots/new
  def new
    @pilot = Pilot.new
  end

  # GET /pilots/1/edit
  def edit
  end

  # POST /pilots
  def create
    @pilot = Pilot.new(pilot_params)
    if @pilot.save
      redirect_to @pilot, notice: 'Pilot was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pilots/1
  def update
    if @pilot.update(pilot_params)
      redirect_to @pilot, notice: 'Pilot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pilots/1
  def destroy
    @pilot.destroy
    redirect_to pilots_url, notice: 'Pilot was successfully destroyed.'
  end

  private
    def set_pilot
      @pilot = Pilot.find(params[:id])
    end

    def pilot_params
      params.require(:pilot)
        .permit(:first_name, :last_name, :email, :certification_type)
    end
end
