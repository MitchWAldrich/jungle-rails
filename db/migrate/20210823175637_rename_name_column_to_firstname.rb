class RenameNameColumnToFirstname < ActiveRecord::Migration
  def self.up
    rename_column :users, :name, :firstname
  end

  def self.down
    rename_column :users, :firstname, :name
  end
end
