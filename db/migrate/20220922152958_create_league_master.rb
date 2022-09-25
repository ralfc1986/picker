class CreateLeagueMaster < ActiveRecord::Migration[6.0]
  def change
    create_table :league_masters do |t|
      t.references :day, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :points
      t.integer :position
      t.integer :position_movement
      t.timestamps
    end
  end
end
