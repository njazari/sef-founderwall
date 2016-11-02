class DedicationsController < ApplicationController
    def show
        @dedication = Dedication.find(params[:id])
        if @dedication.status == false
            flash[:error] = "dedication"
            redirect_to errors_path
        end
        @hospital = Hospital.find(@dedication.hospital_id)
    end
    
    def new
    end
    
    def edit
        @dedication = Dedication.find(params[:id])
    end
    
    def update
        @dedication = Dedication.find(params[:id])
        @dedication.dedication = params[:dedication][:dedication]
        @dedication.status = params[:dedication][:status]
        @dedication.save!
        flash[:notice] = "Thank you for submitting your dedication"
        redirect_to dedication_path(@dedication)
    end
end
