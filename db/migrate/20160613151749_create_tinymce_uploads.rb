class CreateTinymceUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :tinymce_uploads do |t|
      t.string :image
      t.timestamps
    end
  end
end
