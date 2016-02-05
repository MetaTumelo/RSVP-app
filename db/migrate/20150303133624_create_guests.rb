class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.boolean :status
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
