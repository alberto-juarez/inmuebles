class CreateDuenos < ActiveRecord::Migration[6.0]
  def change
    create_table :duenos do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :tel
      t.string :cel
      t.string :comments
      t.references :property, null: false

      t.timestamps
    end
  end
end
