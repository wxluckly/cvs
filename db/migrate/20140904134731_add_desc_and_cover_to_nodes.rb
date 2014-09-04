class AddDescAndCoverToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :cover, :string
    add_column :nodes, :desc, :string
  end
end
