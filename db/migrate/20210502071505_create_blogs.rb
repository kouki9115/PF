class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :image_id
      t.string :scene
      t.string :partner
      t.string :name
      t.string :price
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
