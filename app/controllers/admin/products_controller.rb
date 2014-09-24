class Admin::ProductsController < Admin::BaseController

  def index
    @products = Product.paginate(page: params[:page]).order("id desc")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    flash[:notice] = 'success' if @product.update_attributes(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path }
        format.js
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    flash[:notice] = "删除成功" if @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path }
      format.json { render json: {status: true}.to_json }
    end
  end 

  private
  def product_params
    params.require(:product).permit(:sku, :price, :weight, :dimensions, :summary, :stock)
  end

end