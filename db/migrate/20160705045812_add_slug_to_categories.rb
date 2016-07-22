class AddSlugToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true
    
    add_column :orders, :slug, :string
    add_index :orders, :slug, unique: true
  end
end
