class AddQuestionToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :question, :text
  end
end
