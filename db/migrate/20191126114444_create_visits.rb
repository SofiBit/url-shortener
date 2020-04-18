class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.string :country
      t.string :ip
      t.references :link, foreign_key: true

      t.timestamps
    end
  end
end
