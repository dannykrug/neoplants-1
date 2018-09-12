class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :img_url
      t.integer :water_points, default:1
      t.integer :soil_points, default:1
      t.float :hp, default:1
      t.integer :state_id
      t.integer :ailment_id

      t.timestamps
    end
  end
end
