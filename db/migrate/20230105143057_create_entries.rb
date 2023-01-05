class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :name
      t.string :title
      t.integer :session
      t.text :body

      t.timestamps
    end
  end
end
