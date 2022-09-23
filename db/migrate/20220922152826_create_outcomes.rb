class CreateOutcomes < ActiveRecord::Migration[6.0]
  def change
    create_table :outcomes, id: false do |t|
      t.string :code, primary_key: true
      t.string :name
    end
  end
end
