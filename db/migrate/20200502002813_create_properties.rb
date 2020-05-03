class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references :account
      t.string :idprop
      t.string :zona
      t.string :colonia
      t.integer :precio
      t.integer :mConst
      t.integer :mTerreno
      t.float :banos
      t.integer :recamaras
      t.string :foto

      t.timestamps
    end
  end
end
