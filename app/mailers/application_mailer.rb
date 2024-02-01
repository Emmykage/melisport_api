class ApplicationMailer < ActionMailer::Base
  # default from: 'from@example.com'
  default from: "notification@example.com"
  layout 'mailer'
end
