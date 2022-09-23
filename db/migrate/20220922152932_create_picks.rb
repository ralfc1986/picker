class CreatePicks < ActiveRecord::Migration[6.0]
  def change
    create_table :picks do |t|
      t.references :user, foreign_key: true
      t.references :match, foreign_key: true
      t.string :outcome_code, foreign_key: {to_table: :outcome, column: :code}
      t.integer :score
      t.timestamps
    end
  end
end
