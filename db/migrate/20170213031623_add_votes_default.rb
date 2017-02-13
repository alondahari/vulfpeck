class AddVotesDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :entries, :votes, :integer, default: 0
  end
end
