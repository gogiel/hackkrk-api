class AddStringValueToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :string_value, :text
  end
end
