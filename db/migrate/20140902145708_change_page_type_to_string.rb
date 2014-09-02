class ChangePageTypeToString < ActiveRecord::Migration
  def change
    change_table :nodes do |t|
      t.change :page_type, :string
    end
  end
end
