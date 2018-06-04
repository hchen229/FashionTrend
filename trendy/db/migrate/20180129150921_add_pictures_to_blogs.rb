class AddPicturesToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :pictures, :json
  end
end
