class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.all
    end
    def show
    end
end
