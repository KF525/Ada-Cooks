class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :usages, :type, :format
  end
end
