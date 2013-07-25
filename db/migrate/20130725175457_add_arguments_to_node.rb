class AddArgumentsToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :arguments, :text
    add_column :nodes, :function, :text
  end
end
