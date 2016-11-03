class DonorsController < ApplicationController
    def show
        @donor = Donor.find(params[:id])
        if @donor.status == false
            flash[:error] = "donor"
            redirect_to errors_path
        end
    end
end
