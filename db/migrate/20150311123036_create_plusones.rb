class CreatePlusones < ActiveRecord::Migration
  def change
    create_table :plusones do |t|
      t.string :name
      t.string :oldness
      t.belongs_to :guest, index: true

      t.timestamps
    end
  end
end
