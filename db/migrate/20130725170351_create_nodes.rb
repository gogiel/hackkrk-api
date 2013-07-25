class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :kind
      t.string :type
      t.integer :integer_value

      t.timestamps
    end
  end
end
