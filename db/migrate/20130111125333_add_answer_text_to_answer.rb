class AddAnswerTextToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :answer_string, :string
  end
end
