class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :cel
      t.string :email
      t.string :comments
      t.references :account

      t.timestamps
    end
  end
end
