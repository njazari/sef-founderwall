class ContactFormsController < ApplicationController
    def new
      @contact_form = ContactForm.new
    end
    
    def index
      redirect_to  new_contact_form_path
    end

    def create
      begin
        File.open("logging.txt", "a") do |f|
          f.write("START LOGGING \n")
        end
        @contact_form = ContactForm.new(params[:contact_form])
        @contact_form.request = request
        @spam = false
        if not @contact_form.nickname.empty?
          @spam = true
          @message = "Sorry, this message appears to be spam and was not delivered."
        else
          if @contact_form.deliver # this line is here to trigger css styling/input validation
            File.open("logging.txt", "a") do |f|
              f.write("Before message \n")
            end
            if @contact_form.send_message.code == 200
              File.open("logging.txt", "a") do |f|
                f.write("After messafe \n")
              end
              @message = 'Thank you for your message!'
            else
              @message = "Could not send message. Try again"
            end
          else
            render :new
          end
      end
      rescue ScriptError
        flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
      end
    end
end
