class AddTwitterToElements < ActiveRecord::Migration[7.0]
  def change
    add_column :elements, :twitter_handle, :string
  end
end
