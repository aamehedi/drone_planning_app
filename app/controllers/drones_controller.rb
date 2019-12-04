class DronesController < ApplicationController
  before_action :set_drone, only: [:show, :edit, :update, :destroy]

  # GET /drones
  def index
    @drones = Drone.all
  end

  # GET /drones/1
  def show
  end

  # GET /drones/new
  def new
    @drone = Drone.new
  end

  # GET /drones/1/edit
  def edit
  end

  # POST /drones
  def create
    @drone = Drone.new(drone_params)

    if @drone.save
      redirect_to @drone, notice: 'Drone was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /drones/1
  def update
    if @drone.update(drone_params)
      redirect_to @drone, notice: 'Drone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /drones/1
  def destroy
    @drone.destroy
    redirect_to drones_url, notice: 'Drone was successfully destroyed.'
  end

  private

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(:nickname, :make_and_model, :serial_number, :manufactured_year)
  end
end
