class DedicationsController < ApplicationController
    def show
        @dedication = Dedication.find(params[:id])
    end
end
