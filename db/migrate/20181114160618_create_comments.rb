class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :discussion, foreign_key: true
      t.string :name
      t.string :email
      t.text :body
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
