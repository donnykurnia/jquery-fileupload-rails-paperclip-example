class AddRefidToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :reffid, :string
    add_index :uploads, :reffid
  end
end
