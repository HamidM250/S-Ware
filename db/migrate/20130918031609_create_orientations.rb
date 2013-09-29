class CreateOrientations < ActiveRecord::Migration
  def change
    create_table :orientations do |t|
      t.string :presenter
      t.date :date
      t.time :time
      t.datetime :datetime
      
      t.timestamps
    end
  end
end