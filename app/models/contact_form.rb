class ContactForm < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :file,      :attachment => true

  attribute :message
  attribute :nickname,  :captcha  => true

  def send_message
    RestClient.post "https://api:key-8ea371e6d27947f8585fabe38f3eaea3"\
    "@api.mailgun.net/v3/sandbox20eb7f8a89f94fd7a615b95e0ce9d583.mailgun.org/messages",
    :from => "[#{name}] Wall of Founders Support <postmaster@sandbox20eb7f8a89f94fd7a615b95e0ce9d583.mailgun.org>",
    :to => "Sankara Eye Foundation <integrations@giftofvision.org>",
    :subject => "WoF Support Email",
    :text => "Message from #{name} (#{email}): \n\n #{message}"
  end

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Wall of Founders [#{name}]",
      :to => "integrations@giftofvision.org",
      :from => %("#{name}" <#{email}>)
    }
  end
end