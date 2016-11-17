# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the hospital page for "(.*)"$/
      hospital_path(Hospital.find_by_name($1))
    when /^the dedication page for dedication (.*)$/
      dedication_path(Dedication.find($1))
    when /^the donor page for "(.*)"$/
      donor_path(Donor.where(:first_name => $1.split[0], :last_name => $1.split[1]).pluck(:id)[0])
    when /^the admin page$/
      rails_admin_path
    when /^the hospital page of admin$/
      '/admin/hospital'
    when /^the individual dedication page for "(.*)" with dedication "(.*)"$/
      dedication_path(Donor.where(:first_name => $1.split[0], 
      :last_name => $1.split[1]).pluck(:id)[0], Dedication.find($2))
    when /^the all dedications page$/
      dedications_path
    when /^the edit page for dedication (.*)$/
      edit_dedication_path(Dedication.find($1))
    when /^the error page$/
      errors_path
    when /^the sign in page$/
      new_user_session_path
    when /^the sign up page$/
      new_user_registration_path
    when /^the submit dedication page with donor id (.*)$/
#      edit_hopsital_dedication_path($1, )
      '/'
    when /^the new contact page$/
      new_contact_form_path
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)