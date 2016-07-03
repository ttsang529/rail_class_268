class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :post_id
      t.integer :category_id
    end
  end
end
