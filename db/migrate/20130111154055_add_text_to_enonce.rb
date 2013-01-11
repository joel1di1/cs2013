class AddTextToEnonce < ActiveRecord::Migration
  def change
    add_column :enonces, :text, :text
  end
end
