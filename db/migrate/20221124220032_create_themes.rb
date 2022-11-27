class CreateThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :themes do |t|
      t.string :background_color
      t.string :button_color
      t.string :text_color
      t.belongs_to :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
