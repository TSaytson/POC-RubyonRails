class CreatePassports < ActiveRecord::Migration[7.1]
  def change
    create_table :passports do |t|
      t.string :country

      t.timestamps
    end
  end
end
