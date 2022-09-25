class CreateLeagueByDay < ActiveRecord::Migration[6.0]
  def change
    create_table :league_by_days do |t|
      t.references :day, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :points
      t.timestamps
    end
  end
end
