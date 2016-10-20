class HospitalsController < ApplicationController
    
    def index
        @hospitals = Hospital.all
        #byebug
    end
    
    def show
        @hospital = Hospital.find(params[:id])
    end
end
