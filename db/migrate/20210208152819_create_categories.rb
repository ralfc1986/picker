class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps  #to get the created_at and updated_at fields
    end
  end
end
