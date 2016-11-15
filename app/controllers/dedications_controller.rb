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
        if parms[:publish]
            flash[:notice] = "Your dedication has been published."
            @dedication.publish = true
        end
        @dedication.save!
        if @dedication.status
            redirect_to dedication_path(@dedication)
        else 
            redirect_to root_path
        end
    end
end
