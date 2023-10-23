class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :name

      t.timestamps
      t.belongs_to :album, index: true
    end
  end
end
