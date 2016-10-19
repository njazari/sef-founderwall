class DonorsController < ApplicationController
    def show
        @donor = Donor.find(params[:id])
    end
end
