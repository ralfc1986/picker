class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :day, foreign_key: true
      t.string :stage_code, foreign_key: {to_table: :stages, column: :code}
      t.datetime :started_at
      t.string :home_country_code
      t.string :away_country_code
      t.float :home_odds
      t.float :away_odds
      t.float :draw_odds
      t.string :winner
    end
  end
end
