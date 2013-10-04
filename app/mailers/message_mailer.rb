class MessageMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def new_message(message)
  	@message = message
    mail(to: "chris@refreshteesside.org", subject: 'NEW MESSAGE :: REFRESH TEESSIDE')
  end
end
