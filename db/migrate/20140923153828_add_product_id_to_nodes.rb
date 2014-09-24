class AddProductIdToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :product_id, :integer
  end
end
