class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title,               null: false
      t.text :explanation,         null: false
      t.string :rod
      t.string :reel
      t.string :line
      t.string :spot
      t.string :fish
      t.timestamps
    end
  end
end
