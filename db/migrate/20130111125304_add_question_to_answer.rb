class AddQuestionToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :question, :string, :limit => 2000
  end
end
