class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages

      t.timestamps

      t.belongs_to :author, index: true
    end
  end
end
