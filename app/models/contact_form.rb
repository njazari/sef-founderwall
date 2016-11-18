require 'rest-client'

class ContactForm < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :file,      :attachment => true

  attribute :message
  attribute :nickname,  :captcha  => true

  def send_message
    if self.valid?
      api_key = 'key-8ea371e6d27947f8585fabe38f3eaea3'
      mailgun_domain = 'sandbox20eb7f8a89f94fd7a615b95e0ce9d583.mailgun.org'
      RestClient.post "https://api:#{api_key}"\
      "@api.mailgun.net/v3/#{mailgun_domain}/messages",
      :from => "[#{name}] Wall of Founders Support <postmaster@#{mailgun_domain}>",
      :to => "Sankara Eye Foundation <integrations@giftofvision.org>",
      :subject => "WoF Support Email",
      :text => "Message from #{name} (#{email}): \n\n #{message}"
    end
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