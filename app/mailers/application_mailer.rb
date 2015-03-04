class ApplicationMailer < ActionMailer::Base
  default from: "marcvanderpeet@gmail.com"
  layout 'mailer'
end

class UserMailer < ApplicationMailer
end