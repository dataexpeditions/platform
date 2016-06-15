class AddUserToTinymceUploads < ActiveRecord::Migration[5.0]
  def change
    add_reference :tinymce_uploads, :user, index: true
  end
end
