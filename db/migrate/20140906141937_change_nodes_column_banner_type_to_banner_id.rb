class ChangeNodesColumnBannerTypeToBannerId < ActiveRecord::Migration
  def change
    change_table :nodes do |t|
      t.rename :banner_type, :banner_id
    end
  end
end
