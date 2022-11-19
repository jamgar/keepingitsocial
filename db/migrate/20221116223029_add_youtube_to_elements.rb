class AddYoutubeToElements < ActiveRecord::Migration[7.0]
  def change
    add_column :elements, :youtube, :string
  end
end
