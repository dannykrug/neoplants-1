class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :water_points
      t.integer :soil_points
      t.float :hp
      t.integer :state_id
      t.integer :ailment_id

      t.timestamps
    end
  end
end
