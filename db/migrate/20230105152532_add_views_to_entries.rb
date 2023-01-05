class AddViewsToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :views, :integer, default: 0
  end
end
