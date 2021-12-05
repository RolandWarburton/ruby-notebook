class RobotsController < ApplicationController
  before_action :set_robot, only: [:show, :update, :destroy]

  # GET /robots
  def index
    @robots = Robot.all

    render json: @robots
  end

  # GET /robots/1
  def show
    render json: @robot
  end

  # POST /robots
  def create
    @robot = Robot.new(robot_params)

    puts "asdfasdfasdf"
    puts "asdfasdfasdf"
    puts "asdfasdfasdf"

    if @robot.save
      render json: @robot, status: :created, location: @robot
    else
      render json: @robot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /robots/1
  def update
    if @robot.update(robot_params)
      render json: @robot
    else
      render json: @robot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /robots/1
  def destroy
    @robot.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_robot
    @robot = Robot.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def robot_params
    params.require(:robot).permit(:name, :profession, :fly)
  end
end
