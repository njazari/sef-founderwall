class DedicationsController < ApplicationController
    def show
        @dedication = Dedication.find(params[:id])
    end
    
    def edit
        @dedication = Dedication.find(params[:id])
    end
end
