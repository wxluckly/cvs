class Admin::BannersController < Admin::BaseController

  def index
    @banners = Banner.paginate(page: params[:page]).order("id desc")
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    respond_to do |format|
      if @banner.save
        format.html { redirect_to admin_banners_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    flash[:notice] = 'success' if @banner.update_attributes(banner_params)
    respond_to do |format|
      if @banner.save
        format.html { redirect_to admin_banners_path }
        format.js
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    flash[:notice] = "删除成功" if @banner.destroy
    respond_to do |format|
      format.html { redirect_to admin_banners_path }
      format.json { render json: {status: true}.to_json }
    end
  end 

  private
  def banner_params
    params.require(:banner).permit(:image, :name)
  end

end