class AddPersonRefToCidades < ActiveRecord::Migration[7.0]
  def change
    add_reference :people, :cidade, foreign_key: true
  end
end
