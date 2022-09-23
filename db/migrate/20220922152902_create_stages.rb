class CreateStages < ActiveRecord::Migration[6.0]
  def change
    create_table :stages, id: false do |t|
      t.string :code, primary_key: true
      t.string :name
      t.integer :weighting
    end
  end
end
