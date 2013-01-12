class CreateScalaskels < ActiveRecord::Migration
  def change
    create_table :scalaskels do |t|

      t.timestamps
    end
  end
end
