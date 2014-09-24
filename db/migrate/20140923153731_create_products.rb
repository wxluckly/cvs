class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :sku
      t.string  :price
      t.string  :weight
      t.string  :dimensions
      t.text    :summary
      t.integer :stock
      t.timestamps
    end
  end
end
