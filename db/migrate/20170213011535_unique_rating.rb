class UniqueRating < ActiveRecord::Migration[5.0]
  def change
    add_index :entries, :rating, unique: true
  end
end
