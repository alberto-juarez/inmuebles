class Details < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :descripcion,:text
    add_column :properties, :tipoOp,:text
    add_column :properties, :tipoProp,:text
  end
end
