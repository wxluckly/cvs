class Admin::NodeAncestriesController < Admin::BaseController
  def index
    @node_ancestries = Node.select{ |node| node.is_root? } 
  end
end