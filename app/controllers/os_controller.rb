class OsController < ApplicationController
  before_action :set_o, only: [:show, :update, :destroy]

  # GET /os
  def index
    @os = O.all

    render json: @os
  end

  # GET /os/1
  def show
    render json: @o
  end

  # POST /os
  def create
    @o = O.new(o_params)

    if @o.save
      render json: @o, status: :created, location: @o
    else
      render json: @o.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /os/1
  def update
    if @o.update(o_params)
      render json: @o
    else
      render json: @o.errors, status: :unprocessable_entity
    end
  end

  # DELETE /os/1
  def destroy
    @o.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_o
      @o = O.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def o_params
      params.require(:o).permit(:name, :edition, :package_manager)
    end
end
