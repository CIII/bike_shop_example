class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.integer :size
      t.belongs_to :bike

      t.timestamps null: false
    end
  end
end
