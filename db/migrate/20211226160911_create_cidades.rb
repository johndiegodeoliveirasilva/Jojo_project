class CreateCidades < ActiveRecord::Migration[7.0]
  def change
    create_table :cidades do |t|
      t.references :estado, null: false, foreign_key: true
      t.string :nome
      t.string :string

      t.timestamps
    end
  end
end
