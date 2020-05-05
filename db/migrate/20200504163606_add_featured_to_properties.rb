class AddFeaturedToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :featured, :boolean, default: false
  end
end
