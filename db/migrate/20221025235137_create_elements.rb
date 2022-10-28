class CreateElements < ActiveRecord::Migration[7.0]
  def change
    create_table :elements do |t|
      t.string :element_type
      t.string :title
      t.string :url
      t.integer :position
      t.belongs_to :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
