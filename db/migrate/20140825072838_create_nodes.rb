class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string    :title
      t.text      :content
      t.integer   :banner_type
      t.integer   :page_type
      t.string    :target_page
      t.string    :ancestry
      t.timestamps
    end
  end
end
