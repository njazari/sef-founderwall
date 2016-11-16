class DonorsController < ApplicationController
    def show
        @donor = Donor.find(params[:id])
        @tiers = Dedication.tiers
        @donor_nonempty_dedications_by_tier = @donor.nonempty_dedications_by_tier
        @donor_new_dedications = @donor.new_dedications
        if @donor.status == false
            flash[:error] = "donor"
            redirect_to errors_path
        end
    end
end
