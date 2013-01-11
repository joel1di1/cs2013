class AddTextToEnonce < ActiveRecord::Migration
  def change
    add_column :enonces, :text, :string
  end
end
