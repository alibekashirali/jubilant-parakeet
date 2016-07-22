class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_category
  before_action :set_breadcrumbs
  authorize_resource
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = @category.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @bids = @order.bids
    @comment = Comment.new
    @path = [@order, @comment]
  end

  # GET /orders/new
  def new
    #@category = Category.find(params[:category_id])
    @order = Order.new
    @path = [@category, @order]
  end

  # GET /orders/1/edit
  def edit
    #@category = @order.category
    @path = @order
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @category.orders.new(order_params)
    @order.user = current_user

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
    
    def set_category
      if params[:category_id]
        @category = Category.friendly.find(params[:category_id])
      else
        @category = @order.category
      end
    end
    
    def set_breadcrumbs
      add_breadcrumb "Главная", :root_path
      add_breadcrumb @category.name, category_orders_path(@category)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:what, :width, :height, :length, :weight, :description, :price, :volume, :time, :cargo_picture)
    end
end
