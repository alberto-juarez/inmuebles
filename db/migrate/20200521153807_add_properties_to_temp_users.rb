class AddPropertiesToTempUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :usertemps, :properties
  end
end
