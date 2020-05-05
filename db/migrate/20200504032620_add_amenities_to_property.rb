class AddAmenitiesToProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :ac, :boolean
    add_column :properties, :alarm, :boolean
    add_column :properties, :lift, :boolean
    add_column :properties, :balcony, :boolean
    add_column :properties, :furnished, :boolean
    add_column :properties, :bbq, :boolean
    add_column :properties, :heating, :boolean
    add_column :properties, :fireplace, :boolean
    add_column :properties, :solar, :boolean
    add_column :properties, :jardin, :boolean
    add_column :properties, :backyard, :boolean
    add_column :properties, :pool, :boolean
    add_column :properties, :terrace, :boolean
    add_column :properties, :security, :boolean
    add_column :properties, :comision, :number
  end
end
