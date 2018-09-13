class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.float :max_hp
      t.integer :water_need
      t.integer :soil_need
      t.string :img_url
      t.integer :plant_type_id
      t.integer :next_id

      t.timestamps
    end
  end
end
