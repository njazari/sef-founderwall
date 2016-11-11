class HospitalsController < ApplicationController
    
    def index
        @hospitals = Hospital.where(:status => true)
        @dedications = Dedication.where(:status => true)
        @filterrific = initialize_filterrific(Dedication,params[:filterrific]) or return @dedications = @filterrific.find.page(params[:page])

        respond_to do |format|
            format.html
            format.js
    end

    end
    
    def show
        @hospital = Hospital.find(params[:id])
        if @hospital.status == false
            flash[:error] = "hospital"
            redirect_to errors_path
        end
    end
end
