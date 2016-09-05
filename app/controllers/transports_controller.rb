class TransportsController < ApplicationController
  before_action :set_transport, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /transports
  # GET /transports.json
  def index
    @transports = Transport.all
    # @transports = @user.transports
    # @user = User.find(params[:id])
  end

  # GET /transports/1
  # GET /transports/1.json
  def show
  end

  # GET /transports/new
  def new
    @transport = Transport.new
  end

  # GET /transports/1/edit
  def edit
  end

  # POST /transports
  # POST /transports.json
  def create
    @transport = current_user.transports.new(transport_params)
    respond_to do |format|
      if @transport.save
        current_user.update(driver:true)
        format.html { redirect_to @transport, notice: 'Transport was successfully created.' }
        format.json { render :show, status: :created, location: @transport }
      else
        format.html { render :new }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transports/1
  # PATCH/PUT /transports/1.json
  def update
    respond_to do |format|
      if @transport.update(transport_params)
        format.html { redirect_to @transport, notice: 'Transport was successfully updated.' }
        format.json { render :show, status: :ok, location: @transport }
      else
        format.html { render :edit }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transports/1
  # DELETE /transports/1.json
  def destroy
    @transport.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Transport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport
      @transport = Transport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transport_params
      params.require(:transport).permit(:name, :body_type, :capacity, :picture)
    end
end
