class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :bodypart
      t.text :content
      t.text :comments
      t.integer :creator

      t.timestamps null: false
    end
  end
end
