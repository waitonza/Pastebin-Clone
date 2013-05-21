class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :user
      t.string :paste_content

      t.timestamps
    end
  end
end
