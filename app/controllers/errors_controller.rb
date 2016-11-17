class ErrorsController < ApplicationController
    def index
        if flash[:error] == "hospital" or flash[:error] == "donor" or flash[:error] == "dedication"
            @error = flash[:error]
            render 'status'
        elsif flash[:error] == "admin"
            render 'index'
        else
            redirect_to root_path
        end
    end
end
