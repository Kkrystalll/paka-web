# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(@user.reset_password_token)
    mail(to: @user.email,
         subject: 'PAKA - 更改密碼通知信',
         content_type: 'text/html')
  end
end
