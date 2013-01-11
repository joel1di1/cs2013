class CreateEnonces < ActiveRecord::Migration
  def change
    create_table :enonces do |t|

      t.timestamps
    end
  end
end
