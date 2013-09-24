class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :movie_id
      t.text :text

      t.timestamps
    end
  end
end
