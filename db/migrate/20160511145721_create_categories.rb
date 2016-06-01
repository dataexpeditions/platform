class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :tile_image
      t.integer :studies_count

      t.timestamps
    end
  end
end
