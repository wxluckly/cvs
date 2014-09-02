class NodesController < ApplicationController

  def show
    @node = Node.find(params[:id])
    raise ActiveRecord::RecordNotFound if @node.page_type.blank?
    render @node.page_type || "show"
  end

end