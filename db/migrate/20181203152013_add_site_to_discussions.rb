class AddSiteToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_reference :discussions, :site, foreign_key: true
  end
end
