class AddDuenoToProperty < ActiveRecord::Migration[6.0]
  def change
    add_reference :properties, :duenos
  end
end
