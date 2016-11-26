class HospitalsController < ApplicationController
    
    def index
        @hospitals = Hospital.where(:status => true)
    end
    
    def show
        @hospital = Hospital.find_by_id(params[:id])
        if @hospital.nil? or @hospital.status == false
            @error = 'Hospital'
            render 'errors/status'
        else
            @tiers = Dedication.tiers
            @hospital_published_dedications_by_tier = @hospital.published_dedications_by_tier
        end
    end
end
