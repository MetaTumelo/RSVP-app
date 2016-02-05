class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :bride
      t.string :groom
      t.date :date
      t.belongs_to :guest, index: true

      t.timestamps
    end
  end
end
