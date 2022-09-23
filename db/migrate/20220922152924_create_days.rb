class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.integer :match_day
      t.date :match_date
    end
  end
end
