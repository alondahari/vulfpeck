class NotNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :entries, :name, false
    change_column_null :entries, :email, false
    change_column_null :entries, :entry, false
  end
end
