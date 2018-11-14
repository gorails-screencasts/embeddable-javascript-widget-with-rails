class CreateDiscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :discussions do |t|
      t.string :url
      t.string :title
      t.integer :comments_count

      t.timestamps
    end
  end
end
