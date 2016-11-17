require 'rest-client'

class ContactFormsController < ApplicationController
    def new
      @contact_form = ContactForm.new
    end
    
    def index
      redirect_to  new_contact_form_path
    end

    def create
      begin
        @contact_form = ContactForm.new(params[:contact_form])
        @contact_form.request = request
        @spam = false
        if not @contact_form.nickname.empty?
          @spam = true
          @message = "Sorry, this message appears to be spam and was not delivered."
        else
          response = @contact_form.send_message
          if response.code == 200
             @message = 'Thank you for your message!'
          else
            @message = "Could not send message. Try again"
          end
        end
      rescue ScriptError
        flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
      end
    end
  end