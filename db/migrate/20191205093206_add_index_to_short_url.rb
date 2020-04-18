class AddIndexToShortUrl < ActiveRecord::Migration[5.2]
  def change
    add_index :links, :short_url, using: :btree
  end
end
