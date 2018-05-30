class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.boolean :available
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
