class HospitalsController < ApplicationController
    
    def index
        @hospitals = Hospital.all
<<<<<<< HEAD
    end
    
    def show
        @hospital = Hospital.find(params[:id])
=======
>>>>>>> bc61c23dff0813fe3d4f6c4ccb97a25c6abbd39c
    end
end
