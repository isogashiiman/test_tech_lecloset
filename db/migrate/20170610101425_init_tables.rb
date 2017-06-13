class InitTables < ActiveRecord::Migration[5.0]
  def change
    create_table :products
      add_column :products, :name, :string
    create_table :likes
      add_column :likes, :value, :boolean
      add_reference :likes, :product, foreign_key: true
      add_reference :likes, :user, foreign_key: true
  end
end
