class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :color
      t.string :gender
      t.integer :age
      t.string :favorite_thing
      t.belongs_to :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
