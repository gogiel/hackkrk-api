class AddBoolValueToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :bool_value, :text
  end
end
