class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :source_link
      t.string :short_url

      t.timestamps
    end
  end
end
