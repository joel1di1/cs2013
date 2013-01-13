class UserMailer < ActionMailer::Base

  default :from => 'joel1di1+codestory@gmail.com'

  def new_question(question)
    mail :to => 'joel1di1@gmail.com', :subject => "New Question from codestory : #{question}"
  end
  
end
