class CreateAilments < ActiveRecord::Migration[5.2]
  def change
    create_table :ailments do |t|
      t.string :ailment_type
      t.integer :action_id

      t.timestamps
    end
  end
end
