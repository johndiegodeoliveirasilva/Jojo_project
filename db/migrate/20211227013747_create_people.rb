class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name, index: true
      t.integer :age
      t.string :email, index: { unique: true, name: 'unique_emails'}
      t.timestamps
    end
  end
end
