class CreateAndars < ActiveRecord::Migration[8.1]
  def change
    create_table :andars do |t|
      t.string :numero
      t.text :descricao
      t.references :obra, null: false, foreign_key: true
      t.integer :created_by_id
      t.integer :updated_by_id
      t.integer :deleted_by_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
