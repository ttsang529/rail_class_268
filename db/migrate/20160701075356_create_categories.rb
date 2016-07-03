class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text   :title
      t.integer :connection_id
    end
  end
end
