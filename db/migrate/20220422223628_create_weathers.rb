class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.datetime :sunrise
      t.datetime :sunset
      t.float :temperature
      t.float :feelsLike
      t.integer :humidity
      t.integer :uvi
      t.integer :visability
      t.string :conditions
      t.string :icon
      t.float :maxTemp
      t.float :minTemp
      t.datetime :time

      t.timestamps
    end
  end
end
