class CreateObras < ActiveRecord::Migration[8.1]
  def change
    create_table :obras do |t|
      t.string :nome
      t.string :endereco
      t.integer :progresso
      t.bigint :created_by_id
      t.bigint :updated_by_id
      t.bigint :deleted_by_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
