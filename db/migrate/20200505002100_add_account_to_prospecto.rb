class AddAccountToProspecto < ActiveRecord::Migration[6.0]
  def change
    add_reference :prospectos, :account, foreign_key: true
  end
end
