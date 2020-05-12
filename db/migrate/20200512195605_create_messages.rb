class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :titulo
      t.string :mensaje
      t.references :account, null: false, foreign_key: true
      t.boolean :visible

      t.timestamps
    end
  end
end
