class HospitalsController < ApplicationController
    
    def index
        @hospitals = Hospital.where(:status => true)
    end
    
    
    
    def show
        @hospital = Hospital.find(params[:id])
        @tiers = Dedication.tiers
        @hospital_published_dedications_by_tier = @hospital.published_dedications_by_tier
        if @hospital.status == false
            flash[:error] = "hospital"
            redirect_to errors_path
        end
    end
end
