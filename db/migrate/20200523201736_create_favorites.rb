class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :property, null: false, foreign_key: true
      t.references :usertemps, null: false, foreign_key: true

      t.timestamps
    end
  end
end
