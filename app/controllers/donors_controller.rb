class DonorsController < ApplicationController
    def show
        @donor = Donor.find_by_id(params[:id])
        if @donor.nil? or @donor.status == false
            @error = 'Donor'
            render 'errors/status'
        else
            @tiers = Dedication.tiers
            @donor_published_dedications_by_tier = @donor.dedications_by_tier(true)
            @donor_unpublished_dedications_by_tier = @donor.dedications_by_tier(false)
            if current_user
                @donor_logged_in = current_user.donor == @donor
            else
                @donor_logged_in = false
            end
        end
    end
end
