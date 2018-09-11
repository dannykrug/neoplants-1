class AddPassedTutorialColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :passed_tutorial, :boolean, default:false
  end
end
