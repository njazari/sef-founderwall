class HospitalsController < ApplicationController
    
    WillPaginate.per_page = 10
    
    def index
        @hospitals = Hospital.where(:status => true)
        @dedications = Dedication.where(:status => true)
        
        @filterrific = initialize_filterrific(
            Dedication, 
            params[:filterrific], 
            select_options: {
            sorted_by: Dedication.options_for_sorted_by,
            with_country_id: Hospital.options_for_select,
            }, 
            default_filter_params: {},
        ) or return 
        @dedications = @filterrific.find.page(params[:page])
        
        respond_to do |format|
            format.html
            format.js
        end
        
    rescue ActiveRecord::RecordNotFound => e
        puts "Had to reset filterrific params: #{ e.message }"
        redirect_to(reset_filterrific_url(format: :html)) and return
    end
    
    def show
        @hospital = Hospital.find(params[:id])
        if @hospital.status == false
            flash[:error] = "hospital"
            redirect_to errors_path
        end
    end
end
