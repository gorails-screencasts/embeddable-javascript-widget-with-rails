class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.references :user, foreign_key: true
      t.string :domain

      t.timestamps
    end
  end
end
