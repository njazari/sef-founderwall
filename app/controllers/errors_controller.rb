class ErrorsController < ApplicationController
    def index
        if flash[:error] == "hospital"
            @error = "Hospital"
            render 'status'
        elsif flash[:error] == "donor"
            @error = "Donor"
            render 'status'
        elsif flash[:error] == "dedication"
            @error = "Dedication"
            render 'status'
        elsif flash[:error] == "admin"
            render 'index'
        else
            redirect_to root_path
        end
    end
end
