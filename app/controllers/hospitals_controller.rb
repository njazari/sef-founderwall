class HospitalsController < ApplicationController
    
    def index
        @hospitals = Hospital.where(:status => true)
    end
    
    def show
        @hospital = Hospital.find(params[:id])
        if @hospital.status == false
            flash[:error] = "hospital"
            redirect_to errors_path
        end
    end
end
