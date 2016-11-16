class DonorsController < ApplicationController
    def show
        @donor = Donor.find(params[:id])
        @tiers = Dedication.tiers
        @donor_dedications_by_tier = @donor.dedications_by_tier
        if @donor.status == false
            flash[:error] = "donor"
            redirect_to errors_path
        end
    end
end
