class CreateStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :studies do |t|
      t.references :category, index: true
      t.references :author, index: true
      t.string :title
      t.string :summary
      t.text :body
      t.string :carousel_image
      t.boolean :in_carousel, null: false, default: false
      t.string :state, null: false
      t.string :github_url

      t.datetime :last_edit_at
      t.datetime :submited_for_review_at
      t.datetime :accepted_at
      t.datetime :rejected_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
