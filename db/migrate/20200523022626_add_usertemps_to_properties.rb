class AddUsertempsToProperties < ActiveRecord::Migration[6.0]
  def change
    add_reference :properties, :usertemps, foreign_key: true
  end
end
