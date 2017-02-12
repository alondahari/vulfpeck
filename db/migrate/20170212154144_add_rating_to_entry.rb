class AddRatingToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :rating, :integer, unique: true
  end
end
