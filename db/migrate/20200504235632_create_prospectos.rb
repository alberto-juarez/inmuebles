class CreateProspectos < ActiveRecord::Migration[6.0]
  def change
    create_table :prospectos do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :tel
      t.string :status
      t.string :statuscomment
      t.string :comment

      t.timestamps
    end
  end
end
