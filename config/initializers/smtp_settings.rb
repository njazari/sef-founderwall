ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => "integrations@giftofvision.org",
    :domain               => "gmail.com",
    :password             => "FQhj5*<r!",
    :authentication       => "login",
    :enable_starttls_auto => true
}