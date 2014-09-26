class Admin::NodesController < Admin::BaseController

  def index
    @nodes = Node.select{ |node| node.is_root? } 
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
    @nodes = Node.where(id: params["ids"] || params[:id])
    flash[:notice] = "删除成功" if Node.destroy(@nodes.collect(&:id))
    respond_to do |format|
      format.html { redirect_to admin_nodes_path }
      format.json { render json: {status: true}.to_json }
    end
  end 

  def move
    parent = Node.find(params[:parent_node_id])
    move_nodes = Node.find(params[:ids])
    begin
      ActiveRecord::Base.transaction do
        move_nodes.each do |node|
          node.move(parent)
        end
      end
    rescue
      alert = "不能移动节点到该节点或其下级节点"
    end
    redirect_to admin_nodes_path, alert: alert
  end

  private
  def node_params
    params.require(:node).permit(:content, :title, :sub_title, :banner_type, :parent_id, :page_type, :cover, :desc, :banner_id, :product_id)
  end
end