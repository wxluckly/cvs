class NodesController < ApplicationController

  def show
    @node = Node.find(params[:id])
    render @node.page_type || "show"
  end

end