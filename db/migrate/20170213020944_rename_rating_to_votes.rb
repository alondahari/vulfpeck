class RenameRatingToVotes < ActiveRecord::Migration[5.0]
  def change
    rename_column :entries, :rating, :votes
  end
end
