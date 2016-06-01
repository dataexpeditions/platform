class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :website_url
      t.string :logo
      t.string :description
    end
  end
end
