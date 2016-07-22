class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]
  before_action :set_order
  before_action :set_breadcrumbs
  authorize_resource

  # GET /bids
  # GET /bids.json
  def index
    @bids = @order.bids
    @user = User.find(params[:id])
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
    @path = [@order, @bid]
  end

  # GET /bids/1/edit
  def edit
    @path = @bid
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = @order.bids.new(bid_params)
    @bid.user = current_user

    respond_to do |format|
      if @bid.save
        format.html { redirect_to @bid, notice: 'Bid was successfully created.' }
        format.json { render :show, status: :created, location: @bid }
      else
        format.html { render :new }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to @order, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end
    
    def set_order
      if params[:order_id]
        @order = Order.find(params[:order_id])
      else
        @order = @bid.order
      end
    end
    
    def set_breadcrumbs
      add_breadcrumb "Главная", :root_path
      add_breadcrumb @order.id, order_bids_path(@order)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:price, :start_date, :end_date, :order_id, :user_id)
    end
end
