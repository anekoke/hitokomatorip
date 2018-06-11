class InquiryMailer < ActionMailer::Base
  default from: "hitokomatorip"
  default to: "maildesuyo@anekoke.com"
 
  def received_email(inquiry)
    @inquiry = inquiry
    mail(subject: '【ひとコマとりっぷ】お問い合わせがありました')
  end
 
end