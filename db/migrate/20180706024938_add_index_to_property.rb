class AddIndexToProperty < ActiveRecord::Migration[5.1]
  def change
    add_index :properties, [:lng, :lat]
  end
end
