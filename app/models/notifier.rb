class Notifier < ActionMailer::Base
  default :from => "catherine@coderise.org"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def donate_email(user, payment_option)
    mail( :to => user.email,
    :subject => "Your contribution to Coderise" )
  end
end