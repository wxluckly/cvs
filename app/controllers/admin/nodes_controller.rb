class Admin::NodesController < Admin::BaseController

  def index
    @nodes = Node.paginate(page: params[:page]).order("id desc")
  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.new(node_params)
    respond_to do |format|
      if @node.save
        format.html { redirect_to admin_nodes_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @node = Node.find(params[:id])
  end

  def update
    @node = Node.find(params[:id])
    flash[:notice] = 'success' if @node.update_attributes(node_params)
    respond_to do |format|
      if @node.save
        format.html { redirect_to admin_nodes_path }
        format.js
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @node = Node.find(params[:id])
    flash[:notice] = "删除成功" if @node.destroy
    respond_to do |format|
      format.html { redirect_to admin_nodes_path }
      format.json { render json: {status: true}.to_json }
    end
  end 

  private
  def node_params
    params.require(:node).permit(:content, :title, :sub_title, :banner_type, :parent_id, :page_type, :cover, :desc)
  end

end