class UserMailer < ActionMailer::Base

  default :from => 'joel1di1+codestory@gmail.com'

  def jajascript(params)
  	mail :to => 'joel1di1@gmail.com', :subject => "jajascript request", :text => params
  end

  def new_question(question)
    mail :to => 'joel1di1@gmail.com', :subject => "New Question from codestory : #{question}"
  end
  
end
