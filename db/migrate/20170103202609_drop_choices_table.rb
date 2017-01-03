class DropChoicesTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :choices
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
