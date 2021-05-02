class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.integer :blog_id
      t.integer :user_id
      t.text :comment
      t.float :rate

      t.timestamps
    end
  end
end
